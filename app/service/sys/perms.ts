import { BaseService } from 'egg-cool-service';

/**
 * 权限控制服务类
 */
export default class SysPermsService extends BaseService {
    /**
     * 刷新权限
     * @param userId 用户ID
     */
    async refreshPerms (userId) {
        const roleIds = await this.service.sys.role.getByUser(userId);
        const perms = await this.ctx.service.sys.menu.getPerms(roleIds);
        await this.app.redisSet(`admin:perms:${ userId }`, JSON.stringify(perms), this.app.config.token.expires);
        // 更新部门权限
        const departments = await this.service.sys.department.getByRoleIds(roleIds);
        await this.app.redisSet(`admin:department:${ userId }`, JSON.stringify(departments), this.app.config.token.expires);
    }

    /**
     * 获得权限菜单
     * @param roleIds
     */
    async permmenu (roleIds) {
        const perms = await this.ctx.service.sys.menu.getPerms(roleIds);
        const menus = await this.ctx.service.sys.menu.getMenus(roleIds);
        return { perms, menus };
    }

    /**
     * 根据用户ID获得部门权限
     * @param userId
     * @return 部门ID数组
     */
    async departmentIds (userId) {
        const department = await this.app.redisGet(`admin:department:${ userId }`);
        if (department) {
            return JSON.parse(department);
        } else {
            return [];
        }
    }

}
