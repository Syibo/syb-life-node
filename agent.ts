export default agent => {
    agent.messenger.on('egg-ready', () => {
        const data = { init: [ 'task' ] };
        agent.messenger.sendRandom('init', data);
    });
};
