import { BaseService } from 'egg-cool-service';
import * as md5 from 'md5';
import * as _ from 'lodash';

/**
 * 登录服务类
 */
export default class SysLoginService extends BaseService {
    /**
     * 登录 参数
     * @param param
     */
    async login (param) {
        const { username, captchaId, verifyCode, password } = param;
        const checkV = await this.service.comm.verify.check(captchaId, verifyCode);
        if (checkV) {
            const user = await this.ctx.repo.sys.User.findOne({ username });
            if (user) {
                if (user.status === 0 || user.password !== md5(password)) {
                    throw new Error('账户或密码不正确~');
                }
            } else {
                throw new Error('账户或密码不正确~');
            }
            const roleIds = await this.service.sys.role.getByUser(user.id);
            if (_.isEmpty(roleIds)) {
                throw new Error('该用户未设置任何角色，无法登录~');
            }
            const result = {
                expire: this.app.config.token.expires,
                token: await this.generateToken(user, roleIds, this.app.config.token.expires),
            };
            const perms = await this.ctx.service.sys.menu.getPerms(roleIds);
            const departments = await this.ctx.service.sys.department.getByRoleIds(roleIds);
            await this.app.redisSet(`admin:department:${ user.id }`, JSON.stringify(departments), this.app.config.token.expires);
            await this.app.redisSet(`admin:perms:${ user.id }`, JSON.stringify(perms), this.app.config.token.expires);
            await this.app.redisSet(`admin:token:${ user.id }`, result.token, this.app.config.token.expires);
            return result;
        } else {
            throw new Error('验证码不正确~');
        }
    }

    /**
     * 退出登录
     * @param userId
     */
    async logout(userId) {
        await this.app.redisDel(`admin:perms:${ userId }`);
        await this.app.redisDel(`admin:token:${ userId }`);
        await this.app.redisDel(`admin:department:${ userId }`);
    }

    /**
     * 生成token
     * @param user 用户对象
     * @param roleIds 角色集合
     * @param expires
     */
    async generateToken (user, roleIds, expires) {
        const tokenInfo = {
            roleIds,
            userId: user.id,
            passwordVersion: user.passwordV,
        };
        return this.app.jwt.sign(tokenInfo,
            this.app.config.jwt.secret, {
                expiresIn: expires,
            },
        );
    }
}
