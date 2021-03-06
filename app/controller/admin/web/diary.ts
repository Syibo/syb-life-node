import { BaseController } from 'egg-cool-controller';
import router from 'egg-cool-router';

/**
* 控制器功能描述
*/
@router.prefix('/admin/web/diary', ['add', 'delete', 'update', 'info', 'list', 'page'])
export default class WebDiaryController extends BaseController {
    init() {
        this.setEntity(this.ctx.repo.web.Diary);
        this.setPageOption({
            keyWordLikeFields: [ 'type' ],
        });
    }
}