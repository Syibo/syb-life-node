import { BaseController } from 'egg-cool-controller';
import router from 'egg-cool-router';

/**
 * 欢迎
 */
@router.prefix('/')
export default class WelcomeController extends BaseController {
    @router.get('/')
    public async welcome () {
        await this.ctx.render('welcome', { text: 'HELLO COOL-ADMIN' });
    }
}
