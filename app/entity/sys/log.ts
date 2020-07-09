import { Entity, Column, Index } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
 * 系统日志
 */
@Entity({ name: 'sys_log' })
export default class SysLog extends BaseEntity {
    // 用户ID
    @Index()
    @Column({ nullable: true, type: 'bigint' })
    userId: number;
    // 行为
    @Index()
    @Column({ length: 100 })
    action: string;
    // ip
    @Index()
    @Column({ nullable: true, length: 50 })
    ip: string;
    // ip地址
    @Index()
    @Column({ nullable: true, length: 50 })
    ipAddr: string;
    // 参数
    @Column({ nullable: true, type: 'text' })
    params: string;
}
