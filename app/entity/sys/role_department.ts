import { Entity, Column } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
 * 系统角色部门关系
 */
@Entity({ name: 'sys_role_department' })
export default class SysRoleDepartment extends BaseEntity {
    // 角色ID
    @Column({ type: 'bigint' })
    roleId: number;
    // 部门ID
    @Column({ type: 'bigint' })
    departmentId: number;
}
