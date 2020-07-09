import { BaseService } from 'egg-cool-service';
import * as _ from 'lodash';
import { Brackets } from 'typeorm';

/**
 * 角色服务类
 */
export default class SysRoleService extends BaseService {
    /**
     * 根据用户ID获得角色信息
     * @param userId
     */
    async getByUser (userId) {
        const userRole = await this.nativeQuery('select a.roleId from sys_user_role a where a.userId = ? ', [ userId ]);
        if (!_.isEmpty(userRole)) {
            return userRole.map(e => {
                return e.roleId;
            });
        }
        return [];
    }

    /**
     * 新增角色
     * @param param
     */
    async add (param) {
        param.userId = this.ctx.decoded.userId;
        await this.ctx.repo.sys.Role.save(param);
        await this.updatePerms(param.id, param.menuIdList, param.departmentIdList);
    }

    /**
     * 更新角色
     * @param param
     */
    async update (param) {
        await this.ctx.repo.sys.Role.save(param);
        await this.updatePerms(param.id, param.menuIdList, param.departmentIdList);
    }

    /**
     * 更新权限
     * @param roleId
     * @param menuIdList
     * @param departmentIds
     */
    async updatePerms (roleId, menuIdList?, departmentIds = []) {
        // 更新菜单权限
        await this.ctx.repo.sys.Role_menu.delete({ roleId });
        for (const e of menuIdList) {
            await this.ctx.repo.sys.Role_menu.save({ roleId, menuId: e });
        }
        // 更新部门权限
        await this.ctx.repo.sys.Role_department.delete({ roleId });
        for (const departmentId of departmentIds) {
            await this.ctx.repo.sys.Role_department.save({ roleId, departmentId });
        }
        // 刷新权限
        const userRoles = await this.ctx.repo.sys.User_role.find({ roleId });
        for (const userRole of userRoles) {
            await this.service.sys.perms.refreshPerms(userRole.userId);
        }
    }

    /**
     * 角色信息
     * @param id
     */
    async info (id) {
        const info = await this.getRepo().sys.Role.findOne({ id });
        if (info) {
            const menus = await this.getRepo().sys.Role_menu.find(id !== 1 ? { roleId: id } : {});
            const menuIdList = menus.map(e => {
                return parseInt(e.menuId + '');
            });
            const departments = await this.getRepo().sys.Role_department.find(id !== 1 ? { roleId: id } : {});
            const departmentIdList = departments.map(e => {
                return parseInt(e.departmentId + '');
            });
            return {
                ...info,
                menuIdList,
                departmentIdList,
            };
        }
        return {};
    }

    async list () {
        return this.ctx.repo.sys.Role.createQueryBuilder().where(new Brackets(qb => {
            qb.where('id !=:id', { id: 1 }); // 超级管理员的角色不展示
            // 如果不是超管，只能看到自己新建的或者自己有的角色
            if (this.ctx.decoded.userId !== '1') {
                qb.andWhere('(userId=:userId or id in (:roleId))', {
                    userId: this.ctx.decoded.userId,
                    roleId: this.ctx.decoded.roleIds,
                });
            }
        })).getMany();
    }
}
