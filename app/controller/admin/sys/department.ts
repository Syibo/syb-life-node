import { BaseController } from 'egg-cool-controller';
import router from 'egg-cool-router';

/**
 * 系统-部门
 */
@router.prefix('/admin/sys/department', [ 'add', 'delete', 'update', 'list' ])
export default class SysDepartmentController extends BaseController {
    init() {
        this.setEntity(this.ctx.repo.sys.Department);
        this.setService(this.ctx.service.sys.department);
    }

    /**
     * 部门排序
     */
    @router.post('/order')
    async order() {
        await this.OpService.order(this.getBody());
        this.res();
    }
}
