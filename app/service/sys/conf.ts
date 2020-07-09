import { BaseService } from 'egg-cool-service';

/**
 * 系统配置服务类
 */
export default class SysConfService extends BaseService {
    /**
     * 更新配置参数
     * @param key
     * @param value
     */
    async updateVaule (key, value) {
        await this.nativeQuery(' update sys_conf set cValue = ? where cKey = ? ', [ value, key ]);
    }

    /**
     * 获得配置参数
     * @param key
     */
    async getValue (key) {
        const conf = await this.getRepo().sys.Conf.findOne({ cKey: key });
        if (conf) {
            return conf.cValue;
        }
    }
}
