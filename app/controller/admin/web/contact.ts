import { BaseController } from 'egg-cool-controller';
import router from 'egg-cool-router';

/**
* 控制器功能描述
*/
@router.prefix('/admin/web/contact', ['add', 'delete', 'update', 'info', 'list', 'page'])
export default class WebContactController extends BaseController {
    init() {
        this.setEntity(this.ctx.repo.web.Contact);
    }
}