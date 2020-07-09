import { BaseService } from 'egg-cool-service';
import * as _ from 'lodash';

/**
 * 菜单服务类
 */
export default class SysMenuService extends BaseService {
    /**
     * 获得所有菜单
     */
    async list () {
        // const menus = await this.ctx.repo.sys.Menu.createQueryBuilder().orderBy('orderNum', 'ASC').getMany();
        const menus = await this.getMenus(this.ctx.decoded.roleIds);
        if (!_.isEmpty(menus)) {
            menus.forEach(e => {
                const parentMenu = menus.filter(m => {
                    if (e.parentId === m.id) {
                        return m.name;
                    }
                });
                if (!_.isEmpty(parentMenu)) {
                    e.parentName = parentMenu[0].name;
                }
            });
        }
        return menus;
    }

    /**
     * 更新
     * @param param
     */
    async add (param) {
        await this.ctx.repo.sys.Menu.save(param);
        await this.refreshPerms(param.id);
    }

    /**
     * 更新
     * @param param
     */
    async update (param) {
        await this.ctx.repo.sys.Menu.update(param.id, param);
        await this.refreshPerms(param.id);
    }

    /**
     * 更新权限
     * @param menuId
     */
    async refreshPerms (menuId) {
        const users = await this.nativeQuery('select b.userId from sys_role_menu a left join sys_user_role b on a.roleId = b.roleId where a.menuId = ? group by b.userId', [ menuId ]);
        // 刷新admin权限
        await this.ctx.service.sys.perms.refreshPerms(1);
        if (!_.isEmpty(users)) {
            // 刷新其他权限
            for (const user of users) {
                await this.ctx.service.sys.perms.refreshPerms(user.id);
            }
        }
    }

    /**
     * 根据角色获得权限信息
     * @param {[]} roleIds 数组
     */
    async getPerms (roleIds) {
        let perms = [];
        if (!_.isEmpty(roleIds)) {
            const result = await this.nativeQuery(`
            SELECT a.perms FROM sys_menu a ${ this.setSql(!roleIds.includes('1'),
                'JOIN sys_role_menu b on a.id = b.menuId AND b.roleId in (?)', [ roleIds ]) }
            where 1=1 and a.perms is not NULL
            `, [ roleIds ]);
            if (result) {
                result.forEach(d => {
                    if (d.perms) {
                        perms = perms.concat(d.perms.split(','));
                    }
                });
            }
            perms = _.uniq(perms);
            perms = _.remove(perms, n => {
                return !_.isEmpty(n);
            });
        }
        return _.uniq(perms);
    }

    /**
     * 获得用户菜单信息
     * @param roleIds
     */
    async getMenus (roleIds) {
        return await this.nativeQuery(`
        SELECT
            a.*
        FROM
            sys_menu a
        ${ this.setSql(!roleIds.includes('1'), 'JOIN sys_role_menu b on a.id = b.menuId AND b.roleId in (?)', [ roleIds ]) }
        GROUP BY a.id
        ORDER BY
            orderNum ASC`);
    }

    /**
     * 删除
     * @param ids
     */
    async delete (ids) {
        let idArr;
        if (ids instanceof Array) {
            idArr = ids;
        } else {
            idArr = ids.split(',');
        }
        for (const id of idArr) {
            await this.getRepo().sys.Menu.delete({ id });
            await this.delChildMenu(id);
        }
    }

    /**
     * 删除子菜单
     * @param id
     */
    private async delChildMenu (id) {
        await this.refreshPerms(id);
        const delMenu = await this.ctx.repo.sys.Menu.find({ parentId: id });
        if (_.isEmpty(delMenu)) {
            return;
        }
        const delMenuIds = delMenu.map(e => {
            return e.id;
        });
        await this.ctx.repo.sys.Menu.delete(delMenuIds);
        for (const menuId of delMenuIds) {
            await this.delChildMenu(menuId);
        }
    }
}
