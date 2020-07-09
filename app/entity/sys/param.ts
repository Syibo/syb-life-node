import { Entity, Column, Index } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
 * 参数配置
 */
@Entity({ name: 'sys_param' })
export default class SysParam extends BaseEntity {
    // 键位
    @Index()
    @Column()
    key: string;
    // 名称
    @Column()
    name: string;
    // 数据
    @Column({ type: 'text' })
    data: string;
    // 数据类型 0:字符串 1：数组 2：键值对
    @Column({ default: 0, type: 'tinyint' })
    dataType: number;
    // 备注
    @Column({ nullable: true })
    remark: string;
}
