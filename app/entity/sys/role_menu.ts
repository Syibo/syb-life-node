import { Entity, Column } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
 * 系统角色菜单关系
 */
@Entity({ name: 'sys_role_menu' })
export default class SysRoleMenu extends BaseEntity {
    // 角色ID
    @Column({ type: 'bigint' })
    roleId: number;
    // 菜单ID
    @Column({ type: 'bigint' })
    menuId: number;
}
