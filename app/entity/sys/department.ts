import { Entity, Column } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
 * 系统部门
 */
@Entity({ name: 'sys_department' })
export default class SysDepartment extends BaseEntity {
    // 部门名称
    @Column()
    name: string;
    // 上级部门ID
    @Column({ type: 'bigint', nullable: true })
    parentId: number;
    // 排序
    @Column({ default: 0 })
    orderNum: number;
    // 父菜单名称
    parentName: string;
}
