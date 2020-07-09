import { BaseService } from 'egg-cool-service';
import * as moment from 'moment';
import * as uuid from 'uuid/v1';
import axios from 'axios';
import * as _ from 'lodash';
import * as path from 'path';
import * as fs from 'fs';

/**
 * 文件
 */
export default class File extends BaseService {
    /**
     * 上传文件
     */
    public async upload() {
        const ctx = this.ctx;
        if (_.isEmpty(ctx.request.files)) {
            throw new Error('上传文件为空');
        }
        const file = ctx.request.files[0];
        try {
            const extend = file.filename.split('.');
            const name = moment().format('YYYYMMDD') + '/' + uuid() + '.' + extend[extend.length - 1];
            if (this.app.config.upload === 'local') {
                const target = path.join(this.config.baseDir, `app/public/uploads/${name}`);
                const dirPath = `app/public/uploads/${moment().format('YYYYMMDD')}`;
                if(!fs.existsSync(dirPath)){
                    fs.mkdirSync(dirPath);
                }
                const data = fs.readFileSync(file.filepath);
                fs.writeFileSync(target, data);
                return { url: '/uploads/'+target.split('uploads')[1] };
            } else {
                const result = await ctx.oss.put(name, file.filepath);
                if (result.url && result.url.indexOf('http://') !== -1) {
                    result.url = result.url.replace('http', 'https');
                }
                return result;
            }
        } catch (err) {
            throw new Error('上传文件失败：' + err);
        }
    }

    /**
     * 下载图片链接并上传到oss
     */
    public async uploadWithPic(url) {
        try {
            const ctx = this.ctx;
            const data = await axios.get(url, { responseType: 'arraybuffer' }).then(res => {
                return res.data;
            });
            const name = moment().format('YYYYMMDD') + '/' + uuid() + '.png';
            return await ctx.oss.put(name, data);
        } catch (err) {
            return { url };
        }
    }
}
