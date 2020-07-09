import { BaseController } from 'egg-cool-controller';
import router from 'egg-cool-router';

/**
 * 应用通用控制器
 */
@router.prefix('/app/comm')
export default class AppCommController extends BaseController {
    /**
     * 根据配置参数key获得网页内容(富文本)
     */
    @router.get('/html')
    public async htmlByKey () {
        const { key } = this.getQuery();
        this.ctx.body = await this.service.sys.param.htmlByKey(key);
    }

    /**
     * 上传文件
     */
    @router.post('/upload')
    public async upload () {
        const result = await this.ctx.service.comm.file.upload();
        this.res({ data: result.url });
    }
}
