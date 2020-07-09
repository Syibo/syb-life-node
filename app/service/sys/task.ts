import { BaseService } from 'egg-cool-service';
import * as _ from 'lodash';
import SysTask from '../../entity/sys/task';

/**
 * 系统任务
 */
export default class SysTaskService extends BaseService {
    /**
     * 停止任务
     * @param id
     */
    async stop (id) {
        const task = await this.getRepo().sys.Task.findOne({ id });
        if (task) {
            const job = await this.exist(task.id);
            if (job) {
                await this.ctx.task.sys.removeRepeatable(JSON.parse(task.repeatConf));
            }
            task.status = 0;
            await this.getRepo().sys.Task.update(task.id, task);
            await this.updateNextRunTime(task.id);
        }
    }

    /**
     * 开始任务
     * @param id
     * @param type
     */
    async start (id, type?) {
        const task = await this.getRepo().sys.Task.findOne({ id });
        task.status = 1;
        if (type) {
            task.type = type;
        }
        await this.addOrUpdate(task);
    }

    /**
     * 手动执行一次
     * @param id
     */
    async once (id) {
        const task = await this.getRepo().sys.Task.findOne({ id });
        if (task) {
            await this.ctx.task.sys.add(task, {
                jobId: task.id, removeOnComplete: true, removeOnFail: true,
            });
        }
    }

    /**
     * 新增或修改
     * @param params
     */
    async addOrUpdate (params) {
        let repeatConf;
        await this.getOrmManager().transaction(async transactionalEntityManager => {
            if (params.id) {
                if (params.taskType === 0) {
                    params.limit = null;
                    params.every = null;
                } else {
                    params.cron = null;
                }
                await transactionalEntityManager.update(SysTask, params.id, params);
            } else {
                await transactionalEntityManager.save(SysTask, params);
            }
            if (params.status === 1) {
                const exist = await this.exist(params.id);
                if (exist) {
                    await this.ctx.task.sys.removeRepeatable(JSON.parse(params.repeatConf));
                }
                const jobOp = Object.assign(params);
                await this.ctx.helper.removeEmptyP(jobOp);
                delete jobOp.repeatConf;
                const { opts } = await this.ctx.task.sys.add(params, {
                    jobId: params.id, removeOnComplete: true, removeOnFail: true, repeat: jobOp,
                });
                if (!opts) {
                    throw new Error('任务添加失败，可能由于格式不正确~');
                }
                repeatConf = opts;
            }
        });
        if (params.status === 1) {
            this.ctx.helper.sleep(1000);
            await this.updateNextRunTime(params.id);
            await this.nativeQuery('update sys_task a set a.repeatConf = ? where a.id = ?', [ JSON.stringify(repeatConf.repeat), params.id ]);
        }
    }

    /**
     * 删除
     * @param ids
     */
    async delete (ids) {
        let idArr;
        if (ids instanceof Array) {
            idArr = ids;
        } else {
            idArr = ids.split(',');
        }
        for (const id of idArr) {
            const task = await this.getRepo().sys.Task.findOne({ id });
            const exist = await this.exist(task.id);
            if (exist) {
                await this.ctx.task.sys.removeRepeatable(JSON.parse(task.repeatConf));
            }
            await this.getRepo().sys.Task.delete({ id });
            await this.getRepo().sys.Task_log.delete({ taskId: id });
        }
    }

    /**
     * 任务日志
     * @param query
     */
    async log (query) {
        const { id, status } = query;
        return await this.sqlRenderPage(`
        SELECT
            a.*,
            b.NAME AS taskName
        FROM
        sys_task_log a
        JOIN sys_task b ON a.taskId = b.id
        where 1=1
        ${ this.setSql(id, 'and a.taskId = ?', [ id ]) }
        ${ this.setSql(status, 'and a.status = ?', [ status ]) }
        `, query);
    }

    /**
     * 保存任务记录，成功任务每个任务保留最新20条日志，失败日志不会删除
     * @param task
     * @param status
     * @param detail
     */
    async record (task, status, detail?) {
        await this.getRepo().sys.Task_log.save({ taskId: task.id, status, detail: detail || '' });
        await this.nativeQuery(`DELETE a
        FROM
        sys_task_log a,
            ( SELECT id FROM sys_task_log where taskId = ? AND status = 1 ORDER BY id DESC LIMIT ?, 1 ) b
        WHERE
        a.taskId = ? AND
        a.status = 1 AND
        a.id < b.id`, [ task.id, 19, task.id ]); // 日志保留最新的20条
    }

    /**
     * 初始化任务
     */
    async initTask () {
        const runningTasks = await this.getRepo().sys.Task.find({ status: 1 });
        if (!_.isEmpty(runningTasks)) {
            for (const task of runningTasks) {
                const job = await this.exist(task.id); // 任务已存在就不添加
                if (!job) {
                    this.ctx.logger.info(`init task ${ task.name }`);
                    await this.addOrUpdate(task);
                }
            }
        }
    }

    /**
     * 检查任务是否存在
     * @param jobId
     */
    async exist (jobId) {
        const result = await this.ctx.task.sys.getRepeatableJobs();
        const ids = result.map(e => {
            return e.id;
        });
        return ids.includes(jobId);
    }

    /**
     * 任务ID
     * @param jobId
     */
    async getNextRunTime (jobId) {
        let nextRunTime;
        const result = await this.ctx.task.sys.getRepeatableJobs();
        for (const task of result) {
            if (task.id === jobId.toString()) {
                nextRunTime = new Date(task.next);
                break;
            }
        }
        return nextRunTime;
    }

    /**
     * 更新下次执行时间
     * @param jobId
     */
    async updateNextRunTime (jobId) {
        await this.nativeQuery('update sys_task a set a.nextRunTime = ? where a.id = ?', [ await this.getNextRunTime(jobId), jobId ]);
    }

    /**
     * 刷新任务状态
     */
    async updateStatus () {
        const result = await this.ctx.task.sys.getRepeatableJobs();
        for (const job of result) {
            const task = await this.getRepo().sys.Task.findOne({ id: job.id });
            if (task) {
                setTimeout(async () => { // 2秒后清空任务
                    const nextTime = await this.getNextRunTime(task.id);
                    if (nextTime && nextTime.getTime() <= new Date().getTime() - 999) {
                        this.nativeQuery('update sys_task a set a.status = ?, a.updateTime = ? where a.id = ?', [ 0, new Date(), task.id ]);
                        this.ctx.task.sys.removeRepeatable(JSON.parse(task.repeatConf));
                    }
                }, 2000);
            }
        }
    }

    /**
     * 调用service
     * @param serviceStr
     */
    invokeService (serviceStr) {
        if (serviceStr) {
            let service = this.ctx.service;
            const arr = serviceStr.split('.');
            for (const child of arr) {
                if (child.includes('(')) {
                    const lastArr = child.split('(');
                    const param = lastArr[1].replace(')', '');
                    if (!param) {
                        service[lastArr[0]]();
                    } else {
                        service[lastArr[0]](JSON.parse(param));
                    }
                } else {
                    service = service[child];
                }
            }
        }
    }
}
