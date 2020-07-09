import { BaseController } from 'egg-cool-controller';
import router from 'egg-cool-router';

/**
 * 系统-用户
 */
@router.prefix('/admin/sys/user', [ 'add', 'delete', 'update', 'info', 'list', 'page' ])
export default class SysUserController extends BaseController {
    init() {
        this.setEntity(this.ctx.repo.sys.User);
        this.setService(this.service.sys.user);
    }

    /**
     * 移动部门
     */
    @router.post('/move')
    async move() {
        await this.OpService.move(this.getBody());
        this.res();
    }
}
