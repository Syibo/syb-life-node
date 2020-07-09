import { BaseController } from 'egg-cool-controller';
import router from 'egg-cool-router';

/**
 * 系统-任务
 */
@router.prefix('/admin/sys/task', [ 'add', 'delete', 'update', 'info', 'page' ])
export default class SysTaskController extends BaseController {
    init () {
        this.setEntity(this.ctx.repo.sys.Task);
        this.setPageOption({
            fieldEq: [ 'status', 'type' ],
        });
        this.setService(this.service.sys.task);
    }

    /**
     * 手动执行一次
     */
    @router.post('/once')
    async once () {
        await this.OpService.once(this.getBody().id);
        this.res();
    }

    /**
     * 暂停任务
     */
    @router.post('/stop')
    async stop () {
        const { id } = this.getBody();
        await this.OpService.stop(id);
        this.res();
    }

    /**
     * 开始任务
     */
    @router.post('/start')
    async start () {
        const { id, type } = this.getBody();
        await this.OpService.start(id, type);
        this.res();
    }

    /**
     * 日志
     */
    @router.get('/log')
    async log () {
        this.res({ data: await this.OpService.log(this.getQuery()) });
    }
}
