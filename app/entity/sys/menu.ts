import { Entity, Column } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
 * 系统菜单
 */
@Entity({ name: 'sys_menu' })
export default class SysMenu extends BaseEntity {
    // 父菜单ID
    @Column({ type: 'bigint', nullable: true })
    parentId: number;
    // 菜单名称
    @Column()
    name: string;
    // 菜单地址
    @Column({ nullable: true })
    router: string;
    // 权限标识
    @Column({ nullable: true })
    perms: string;
    // 类型   0：目录   1：菜单   2：按钮
    @Column({ default: 0, type: 'tinyint' })
    type: number;
    // 图标
    @Column({ nullable: true })
    icon: string;
    // 排序
    @Column({ default: 0 })
    orderNum: number;
    // 视图地址
    @Column({ nullable: true })
    viewPath: string;
    // 路由缓存
    @Column({ default: true })
    keepAlive: boolean;
    // 父菜单名称
    parentName: string;
}
