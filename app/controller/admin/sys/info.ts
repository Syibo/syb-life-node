import { BaseController } from 'egg-cool-controller';
import router from 'egg-cool-router';

/**
 * 系统-信息
 */
@router.prefix('/admin/sys/info', [ 'list' ])
export default class SysInfoController extends BaseController {
    init () {
        this.setEntity(this.ctx.repo.sys.Department);
    }

    /**
     * 获得监控记录
     */
    @router.get('/record')
    async record () {
        this.res({ data: await this.service.sys.info.record() });
    }
}
