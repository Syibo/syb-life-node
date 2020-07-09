import { Entity, Column } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
 * 系统用户角色关系表
 */
@Entity({ name: 'sys_user_role' })
export default class SysUserRole extends BaseEntity {
    // 用户ID
    @Column({ type: 'bigint' })
    userId: number;
    // 角色ID
    @Column({ type: 'bigint' })
    roleId: number;
}
