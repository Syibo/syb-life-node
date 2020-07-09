import { BaseService } from 'egg-cool-service';
import * as _ from 'lodash';
import * as md5 from 'md5';

/**
 * 系统-用户
 */
export default class SysUserService extends BaseService {
    /**
     * 分页查询
     * @param query
     */
    async page (query) {
        const { keyWord, status, departmentIds = '' } = query;
        const permsDepartmentArr = await this.service.sys.perms.departmentIds(this.ctx.decoded.userId); // 部门权限
        const sql = `
        SELECT
            a.id,a.name,a.nickName,a.headImg,a.email,a.remark,a.status,a.createTime,a.updateTime,a.username,a.phone,a.departmentId,
            GROUP_CONCAT(c.name) AS roleName,
            d.name as departmentName
        FROM
            sys_user a
            LEFT JOIN sys_user_role b ON a.id = b.userId
            LEFT JOIN sys_role c ON b.roleId = c.id
            LEFT JOIN sys_department d on a.departmentId = d.id
        WHERE 1 = 1
            ${ this.setSql(departmentIds, 'and a.departmentId in (?)', [ departmentIds.split(',') ]) }
            ${ this.setSql(status, 'and a.status = ?', [ status ]) }
            ${ this.setSql(keyWord, 'and (a.name LIKE ? or a.username LIKE ?)', [ `%${ keyWord }%`, `%${ keyWord }%` ]) }
            ${ this.setSql(true, 'and a.id != ?', [ 1 ]) }
            ${ this.setSql(this.ctx.decoded.userId !== '1', 'and a.departmentId in (?)', [ !_.isEmpty(permsDepartmentArr) ? permsDepartmentArr : [ null ] ]) }
        GROUP BY a.id
        `;
        return this.sqlRenderPage(sql, query);
    }

    /**
     * 新增
     * @param param
     */
    async add (param) {
        const exists = await this.getRepo().sys.User.findOne({ username: param.username });
        if (!_.isEmpty(exists)) {
            throw new Error('用户名已经存在~');
        }
        param.password = md5('123456'); // 默认密码  建议未改密码不能登陆
        await this.getRepo().sys.User.save(param);
        await this.updateUserRole(param);
    }

    /**
     * 修改
     * @param param 数据
     */
    async update (param?) {
        if (param.id && param.id === 1) {
            throw new Error('非法操作~');
        }
        if (!_.isEmpty(param.password)) {
            param.password = md5(param.password);
        } else {
            delete param.password;
        }
        if (param.status === 0) {
            await this.forbidden(param.id);
        }
        await this.getRepo().sys.User.save(param);
        await this.updateUserRole(param);
    }

    /**
     * 禁用用户
     * @param userId
     */
    async forbidden (userId) {
        await this.app.redisDel(`admin:token:${ userId }`);
    }

    /**
     * 更新用户角色关系
     * @param user
     */
    async updateUserRole (user) {
        if (user.id === 1) {
            throw new Error('非法操作~');
        }
        await this.getRepo().sys.User_role.delete({ userId: user.id });
        if (user.roleIdList) {
            for (const roleId of user.roleIdList) {
                await this.getRepo().sys.User_role.save({ userId: user.id, roleId });
            }
        }
        await this.service.sys.perms.refreshPerms(user.id);
    }

    /**
     * 根据ID获得信息
     * @param id
     * @param entity
     */
    public async info (id, entity) {
        const info = await entity.findOne({ id });
        const userRoles = await this.nativeQuery('select a.roleId from sys_user_role a where a.userId = ?', [ id ]);
        const department = await this.getRepo().sys.Department.findOne({ id: info.departmentId });
        if (info) {
            delete info.password;
            if (userRoles) {
                info.roleIdList = userRoles.map(e => {
                    return e.roleId;
                });
            }
        }
        delete info.password;
        if (department) {
            info.departmentName = department.name;
        }
        return info;
    }

    /**
     * 获得个人信息
     */
    public async person () {
        return await this.info(this.ctx.decoded.userId, this.getRepo().sys.User);
    }

    /**
     * 修改个人信息
     * @param param
     */
    public async personUpdate (param) {
        param.id = this.ctx.decoded.userId;
        if (!_.isEmpty(param.password)) {
            param.password = md5(param.password);
        } else {
            delete param.password;
        }
        await this.getRepo().sys.User.save(param);
    }

    /**
     * 移动部门
     * @param params
     */
    public async move (params) {
        const { departmentId, userIds } = params;
        await this.nativeQuery('update sys_user a set a.departmentId = ? where a.id in (?)', [ departmentId, userIds ]);
    }
}
