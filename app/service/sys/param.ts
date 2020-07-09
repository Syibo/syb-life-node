import { BaseService } from 'egg-cool-service';

/**
 * 参数配置服务类
 */
export default class SysParamService extends BaseService {
    /**
     * 根据key获得对应的参数
     * @param key
     */
    async dataByKey (key) {
        let result = await this.app.redisGet(`param:${ key }`);
        if (result) {
            result = JSON.parse(result);
            if (result.dataType !== 0) {
                return JSON.parse(result.data);
            } else {
                return result.data;
            }
        }
        return;
    }

    /**
     * 根据key获得对应的网页数据
     * @param key
     */
    async htmlByKey (key) {
        let html = '<html><body>@content</body></html>';
        let result = await this.app.redisGet(`param:${ key }`);
        if (result) {
            result = JSON.parse(result);
            html = html.replace('@content', result.data);
        } else {
            html = html.replace('@content', 'key notfound');
        }
        return html;
    }

    /**
     * 重新初始化缓存
     */
    async modifyAfter () {
        const params = await this.getRepo().sys.Param.find();
        for (const param of params) {
            await this.app.redisSet(`param:${ param.key }`, JSON.stringify(param));
        }
    }
}
