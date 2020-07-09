import { BaseService } from 'egg-cool-service';

/**
 * 系统配置服务类
 */
export default class WebArticleService extends BaseService {
    /**
     * 更新配置参数
     * @param key
     * @param value
     */
    async testSql (value) {
        return await this.nativeQuery(`select * from web_article where artType = ${value}`);
    }

    async artNum () {
        // 连表查询总数
        let sql = `SELECT artName FROM web_article_name`
        return await this.nativeQuery(sql);
    }

    async getHome() {
        let diary = await this.nativeQuery(`select * from web_diary LIMIT 4`);
        let article = await this.nativeQuery(`select * from web_article LIMIT 4`);
        let years = await this.nativeQuery(`select * from web_years LIMIT 3`);
        const newData = {
            diary,
            article,
            years
        }
        return newData;
    }
}
