import { Entity, Column, Index } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
 * 系统角色
 */
@Entity({ name: 'sys_role' })
export default class SysRole extends BaseEntity {
    // 名称
    @Column()
    userId: string;
    // 名称
    @Index({ unique: true })
    @Column()
    name: string;
    // 角色标签
    @Index({ unique: true })
    @Column({ nullable: true, length: 50 })
    label: string;
    // 备注
    @Column({ nullable: true })
    remark: string;
}
