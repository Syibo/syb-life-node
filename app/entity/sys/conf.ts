import { Entity, Column, Index } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
 * 系统配置
 */
@Entity({ name: 'sys_conf' })
export default class SysConf extends BaseEntity {
    // 配置键
    @Index({ unique: true })
    @Column()
    cKey: string;
    // 配置值
    @Column()
    cValue: string;
}
