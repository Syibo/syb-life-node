import { BaseController } from 'egg-cool-controller';
import router from 'egg-cool-router';

/**
 * 系统-日志
 */
@router.prefix('/admin/sys/log', [ 'page' ])
export default class SysLogController extends BaseController {
    init() {
        this.setEntity(this.ctx.repo.sys.Log);
        this.setService(this.service.sys.log);
    }

    /**
     * 清空日志
     */
    @router.post('/clear')
    public async clear () {
        await this.OpService.clear(true);
        this.res();
    }

    /**
     * 设置日志保存时间
     */
    @router.post('/set-keep')
    public async setKeep() {
        await this.service.sys.conf.updateVaule('logKeep', this.getBody().value);
        this.res();
    }

    /**
     * 获得日志保存时间
     */
    @router.get('/get-keep')
    public async getKeep() {
        this.res({ data: await this.service.sys.conf.getValue('logKeep') });
    }
}
