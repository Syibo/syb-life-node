import { BaseService } from 'egg-cool-service';
import * as si from 'systeminformation';
import * as _ from 'lodash';
import * as moment from 'moment';

/**
 * 系统-信息
 */
export default class SysInfoService extends BaseService {
    /**
     * 服务器信息
     */
    async server () {
        const disk = await si.fsSize();
        const mem = await si.mem();
        const network = await si.networkStats();
        const cpu = await si.currentLoad();
        let mysqlConn = await this.nativeQuery("show status like  'Threads%';");
        mysqlConn = mysqlConn.map(e => {
            const r = {};
            r[e.Variable_name] = e.Value;
            return r;
        });
        const mysqlSize = await this.nativeQuery(`SELECT
        CONCAT( TRUNCATE ( SUM( data_length ) / 1024 / 1024, 2 ), 'mb' ) AS data_size,
            CONCAT( TRUNCATE ( SUM( max_data_length ) / 1024 / 1024, 2 ), 'mb' ) AS max_data_size,
            CONCAT( TRUNCATE ( SUM( data_free ) / 1024 / 1024, 2 ), 'mb' ) AS data_free,
            CONCAT( TRUNCATE ( SUM( index_length ) / 1024 / 1024, 2 ), 'mb' ) AS index_size
        FROM
        information_schema.TABLES`);
        // @ts-ignore
        const redis = this.app.redis;
        const redisInfo = await redis.send_command('info');
        const redisInfoArr = redisInfo.split('#').map(e => {
            return _.remove(e.split('\r\n'), n => {
                return !_.isEmpty(n);
            });
        }).slice(1);
        const redisInfoObj = {};
        redisInfoArr.forEach(e => {
            let o = 'Server';
            for (let i = 0; i < e.length; i++) {
                if (i === 0) {
                    o = e[i].trim();
                    redisInfoObj[o] = {};
                } else {
                    const eArr = e[i].split(':');
                    redisInfoObj[o][eArr[0]] = eArr[1];
                }
            }
        });
        return this.simpleData({ server: { disk, mem, network, cpu }, mysql: { mysqlConn, mysqlSize }, redis: redisInfoObj });
    }

    /**
     * 简化数据
     * @param data
     */
    simpleData (data) {
        delete data.server.cpu.cpus;
        delete data.redis.Persistence;
        delete data.redis.Replication;
        delete data.redis.CPU;
        delete data.redis.Cluster;
        return data;
    }

    /**
     * 保存监控记录
     */
    async saveRecord () {
        const data = await this.server();
        const time = moment().format('mm:ss');
        const redisMonitor = await this.app.redisGet('monitor');
        if (_.isEmpty(redisMonitor)) {
            await this.app.redisSet('monitor', JSON.stringify({ data: [ data ], time: [ time ] }));
        } else {
            const redisData = JSON.parse(redisMonitor);
            // 超过30个的话移除第一个
            if (redisData.data.length >= 30) {
                redisData.data.shift();
                redisData.time.shift();
            }
            redisData.data.push(data);
            redisData.time.push(time);
            await this.app.redisSet('monitor', JSON.stringify(redisData));
        }
    }

    /**
     * 获得监控记录
     */
    async record () {
        const data = await this.server();
        const time = moment().format('mm:ss');
        const redisMonitor = await this.app.redisGet('monitor');
        if (_.isEmpty(redisMonitor)) {
            return { data: [ data ], time: [ time ] };
        } else {
            return JSON.parse(redisMonitor);
        }
    }
}
