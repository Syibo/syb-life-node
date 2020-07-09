import { BaseService } from 'egg-cool-service';
import * as _ from 'lodash';

/**
 * 系统-部门
 */
export default class SysDepartmentService extends BaseService {
    /**
     * 获得部门菜单
     */
    async list () {
        const permsDepartmentArr = await this.service.sys.perms.departmentIds(this.ctx.decoded.userId); // 部门权限
        const departments = await this.nativeQuery(`
        SELECT
            *
            FROM
        sys_department a
        WHERE
        1 = 1
        ${ this.setSql(this.ctx.decoded.userId !== '1', 'and a.id in (?)', [ !_.isEmpty(permsDepartmentArr) ? permsDepartmentArr : [ null ] ]) }
        ORDER BY
        a.orderNum ASC`);
        if (!_.isEmpty(departments)) {
            departments.forEach(e => {
                const parentMenu = departments.filter(m => {
                    if (e.parentId === m.id) {
                        return m.name;
                    }
                });
                if (!_.isEmpty(parentMenu)) {
                    e.parentName = parentMenu[0].name;
                }
            });
        }
        return departments;
    }

    /**
     * 根据多个ID获得部门权限信息
     * @param {[]} roleIds 数组
     */
    async getByRoleIds (roleIds) {
        if (!_.isEmpty(roleIds)) {
            if (roleIds.includes('1')) {
                const result = await this.nativeQuery('select a.id from sys_department a');
                return result.map(e => {
                    return parseInt(e.id);
                });
            }
            const result = await this.nativeQuery('select a.departmentId from sys_role_department a where a.roleId in (?) ', [ roleIds ]);
            if (!_.isEmpty(result)) {
                return _.uniq(result.map(e => {
                    return parseInt(e.departmentId);
                }));
            }
        }
        return [];
    }

    /**
     * 部门排序
     * @param params
     */
    async order (params) {
        for (const e of params) {
            await this.getRepo().sys.Department.update(e.id, e);
        }
    }

    /**
     * 删除
     */
    async delete () {
        let { ids, deleteUser } = this.getBody();
        if (!(ids instanceof Array)) {
            ids = ids.split(',');
        }
        await this.getRepo().sys.Department.delete(ids);
        if (deleteUser) {
            await this.nativeQuery('delete from sys_user where departmentId in (?)', [ ids ]);
        } else {
            const topDepartment = await this.ctx.repo.sys.Department.createQueryBuilder().where('parentId is null').getOne();
            if (topDepartment) {
                await this.nativeQuery('update sys_user a set a.departmentId = ? where a.departmentId in (?)', [ topDepartment.id, ids ]);
            }
        }
    }
}
