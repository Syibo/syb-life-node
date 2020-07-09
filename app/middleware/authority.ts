import { Context } from 'egg';
import * as _ from 'lodash';
// 无需token的地址
const noTokenUrl = [
    '/admin/comm/captcha',
    '/admin/comm/login',
    '/admin/comm/logout',
    '/admin/web/article/list',
    '/admin/web/article/page',
    '/admin/web/article/home',
    '/admin/web/article/info',
    '/admin/web/artType/list',
    '/admin/web/diary/list',
    '/admin/web/diary/page',
    '/admin/web/diary/info',
    '/admin/web/contact/page',
    '/admin/web/contact/add',
];

/**
 * 权限控制
 * @constructor
 */
export default function Authority (): any {
    return async (ctx: Context, next: () => Promise<any>) => {
        let statusCode = 200;
        const { url } = ctx;
        const token = ctx.get('Authorization');
        if (_.startsWith(url, '/admin')) {
            if (noTokenUrl.includes(url.split('?')[0])) {
                await next();
                return;
            }
            try {
                ctx.decoded = ctx.app.jwt.verify(token, ctx.app.config.jwt.secret);
                if (ctx.decoded) {
                    if (_.startsWith(url, '/admin/comm/')) {
                        await next();
                        return;
                    }
                    const rToken = await ctx.app.redisGet(`admin:token:${ ctx.decoded.userId }`);
                    if (!rToken) {
                        ctx.status = 401;
                        ctx.body = {
                            code: 1001,
                            message: '登录失效或无权限访问~',
                        };
                        return;
                    }
                    if (rToken !== token && ctx.app.config.SSO) {
                        statusCode = 401;
                    } else {
                        let perms = await ctx.app.redisGet(`admin:perms:${ ctx.decoded.userId }`);
                        if (!_.isEmpty(perms)) {
                            perms = JSON.parse(perms).map(e => {
                                return e.replace(/:/g, '/');
                            });
                            if (!perms.includes(url.split('?')[0].replace('/admin/', ''))) {
                                statusCode = 403;
                            }
                        } else {
                            statusCode = 403;
                        }
                    }
                }
            } catch (e) {
                statusCode = 401;
            }
            if (statusCode > 200) {
                ctx.status = statusCode;
                ctx.body = {
                    code: 1001,
                    message: '登录失效或无权限访问~',
                };
                return;
            }
        }
        await next();
    };
}
