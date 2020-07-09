import { BaseController } from 'egg-cool-controller';
import router from 'egg-cool-router';

/**
 * 系统-参数配置
 */
@router.prefix('/admin/sys/param', [ 'page', 'add', 'delete', 'update', 'info' ])
export default class SysParamController extends BaseController {
    init () {
        this.setEntity(this.ctx.repo.sys.Param);
        this.setPageOption({
            keyWordLikeFields: [ 'name', '`key`' ],
        });
        this.setService(this.service.sys.param);
    }
}
