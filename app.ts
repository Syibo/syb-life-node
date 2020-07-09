import * as moment from 'moment';

export default app => {
    const ctx = app.createAnonymousContext();
    app.beforeStart(() => {
        ctx.logger.info('beforeStart');
        // 格式化时间
        Date.prototype.toJSON = function () {
            return moment(this).format('YYYY-MM-DD HH:mm:ss');
        };
    });

    app.ready(() => {
        ctx.logger.info('=====service start succeed=====');
    });

    app.beforeClose(() => {
        ctx.logger.info('beforeClose');
    });

    app.messenger.on('init', () => {
        ctx.service.sys.task.initTask();
        ctx.logger.info('cool-task init succeed');
    });
};
