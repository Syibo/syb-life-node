import { Entity, Column } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
 * 系统任务
 */
@Entity({ name: 'sys_task' })
export default class SysTask extends BaseEntity {
    // 任务配置
    @Column({ nullable: true, length: 1000 })
    repeatConf: string;
    // 名称
    @Column()
    name: string;
    // cron
    @Column({ nullable: true })
    cron: string;
    // 最大执行次数 不传为无限次
    @Column({ nullable: true })
    limit: number;
    // 每间隔多少毫秒执行一次 如果cron设置了 这项设置就无效
    @Column({ nullable: true })
    every: number;
    // 备注
    @Column({ nullable: true })
    remark: string;
    // 状态 0:停止 1：运行
    @Column({ default: 1, type: 'tinyint' })
    status: number;
    // 开始时间
    @Column({ nullable: true })
    startDate: Date;
    // 结束时间
    @Column({ nullable: true })
    endDate: Date;
    // 数据
    @Column({ nullable: true })
    data: string;
    // 执行的service
    @Column({ nullable: true })
    service: string;
    // 状态 0:系统 1：用户
     @Column({ default: 0, type: 'tinyint' })
    type: number;
    // 下一次执行时间
    @Column({ nullable: true })
    nextRunTime: Date;
    //  状态 0:cron 1：时间间隔
    @Column({ default: 0, type: 'tinyint' })
    taskType: number;
}
