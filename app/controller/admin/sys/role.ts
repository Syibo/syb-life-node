import { BaseController } from 'egg-cool-controller';
import router from 'egg-cool-router';
import { Brackets } from 'typeorm';

/**
 * 系统-角色
 */
@router.prefix('/admin/sys/role', [ 'add', 'delete', 'update', 'info', 'list', 'page' ])
export default class SysRoleController extends BaseController {
    init () {
        this.setEntity(this.ctx.repo.sys.Role);
        this.setPageOption({
            keyWordLikeFields: [ 'name', 'label' ],
            where: new Brackets(qb => {
                qb.where('id !=:id', { id: 1 }); // 超级管理员的角色不展示
                // 如果不是超管，只能看到自己新建的或者自己有的角色
                if (this.ctx.decoded.userId !== '1') {
                    qb.andWhere('(userId=:userId or id in (:roleId))', { userId: this.ctx.decoded.userId, roleId: this.ctx.decoded.roleIds });
                }
            }),
        });
        this.setService(this.service.sys.role);
    }
}
