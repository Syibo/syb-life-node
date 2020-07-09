import { Entity, Column, Index } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
 * 系统任务执行日志
 */
@Entity({ name: 'sys_task_log' })
export default class SysTaskLog extends BaseEntity {
    // 任务ID
    @Index()
    @Column({ nullable: true, type: 'bigint' })
    taskId: number;
    // 状态 0:失败 1：成功
    @Column({ default: 0, type: 'tinyint' })
    status: number;
    // 详情描述
    @Column({ nullable: true, type: 'text' })
    detail: string;
}
