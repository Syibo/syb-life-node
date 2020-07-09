export default app => {
    const ctx = app.createAnonymousContext();
    const queue = app.bull.get(app.fileName(__filename));
    app.ready(() => {
        queue.process((job, done) => {
            try {
                ctx.service.sys.task.invokeService(job.data.service);
                ctx.service.sys.task.record(job.data, 1);
            } catch (e) {
                ctx.service.sys.task.record(job.data, 0, e);
            }
            ctx.service.sys.task.updateNextRunTime(job.data.id);
            ctx.service.sys.task.updateStatus();
            done();
        });
    });
    return queue;
};
