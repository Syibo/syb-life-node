import { BaseService } from 'egg-cool-service';
import SysLog from '../../entity/sys/log';
import * as _ from 'lodash';
import * as moment from 'moment';

/**
 * 日志服务类
 */
export default class SysLogService extends BaseService {
    /**
     * 分页查询日志
     * @param query
     */
    async page (query) {
        const { keyWord } = query;
        const sql = `
        SELECT
            a.*,
            b.name
        FROM
        sys_log a
        LEFT JOIN sys_user b ON a.userId = b.id
        where 1=1
        ${ this.setSql(keyWord, 'and ( b.name like ? or params like ? or ipAddr like ? )', [ `%${ keyWord }%`, `%${ keyWord }%`, `%${ keyWord }%` ]) }`;
        return this.sqlRenderPage(sql, query);
    }

    /**
     * 新增
     * @param url
     * @param params
     * @param userId
     */
    async save (url, params, userId) {
        const ip = await this.ctx.helper.getReqIP();
        const sysLog = new SysLog();
        sysLog.userId = userId;
        sysLog.ip = ip;
        const ipAddrArr = new Array();
        for (const e of ip.split(',')) ipAddrArr.push(await this.ctx.helper.getIpAddr(e));
        sysLog.ipAddr = ipAddrArr.join(',');
        sysLog.action = url;
        if (!_.isEmpty(params)) {
            sysLog.params = JSON.stringify(params);
        }
        await this.getRepo().sys.Log.save(sysLog);
    }

    /**
     * 清空日志
     */
    async clear (isAll?) {
        if (isAll) {
            await this.getRepo().sys.Log.clear();
            return;
        }
        const keepDay = await this.ctx.service.sys.conf.getValue('logKeep');
        if (keepDay) {
            const beforeDate = `${ moment().subtract(keepDay, 'days').format('YYYY-MM-DD') } 00:00:00`;
            await this.nativeQuery(' delete from sys_log where createTime < ? ', [ beforeDate ]);
        } else {
            await this.getRepo().sys.Log.clear();
        }
    }
}
