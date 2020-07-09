import { BaseController } from 'egg-cool-controller';
import router from 'egg-cool-router';

/**
 * 后台通用控制器
 */
@router.prefix('/admin/comm')
export default class AdminCommController extends BaseController {
    /**
     * 登录
     */
    @router.post('/login')
    public async login () {
        this.res({ data: await this.service.sys.login.login(this.getBody()) });
    }

    /**
     * 退出登录
     */
    @router.post('/logout')
    public async logout () {
        if (this.ctx.decoded) {
            await this.service.sys.login.logout(this.ctx.decoded.userId);
        }
        this.res();
    }

    /**
     * 文件上传
     */
    @router.post('/upload')
    public async upload () {
        const result = await this.ctx.service.comm.file.upload();
        this.res({ data: result.url });
    }

    /**
     * 获取图片验证码 SVG
     */
    @router.get('/captcha')
    public async captcha () {
        this.res({ data: await this.ctx.service.comm.verify.captcha(this.getQuery()) });
    }

    /**
     * 获得个人信息
     */
    @router.get('/person')
    public async person () {
        this.res({ data: await this.service.sys.user.person() });
    }

    /**
     * 修改个人信息
     */
    @router.post('/person-update')
    public async personUpdate () {
        this.res({ data: await this.service.sys.user.personUpdate(this.getBody()) });
    }

    /**
     * 权限菜单
     */
    @router.get('/permmenu')
    public async permmenu () {
        this.res({ data: await this.service.sys.perms.permmenu(this.ctx.decoded.roleIds) });
    }
}
