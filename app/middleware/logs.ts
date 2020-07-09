import { Context } from 'egg';

/**
 * 统一异常处理
 * @constructor
 */
export default function Exception (): any {
    return async (ctx: Context, next: () => Promise<any>) => {
        const { url } = ctx;
        ctx.service.sys.log.save(url.split('?')[0], ctx.req.method === 'GET' ? ctx.request.query : ctx.request.body, ctx.decoded ? ctx.decoded.userId : null);
        await next();
    };
}
