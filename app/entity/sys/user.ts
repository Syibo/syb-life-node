import { Entity, Column, Index } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
 * 系统用户
 */
@Entity({ name: 'sys_user' })
export default class SysUser extends BaseEntity {
    // 部门ID
    @Column({ type: 'bigint' })
    departmentId: number;
    // 姓名
    @Column({ nullable: true })
    name: string;
    // 用户名
    @Index({ unique: true })
    @Column({ length: 100 })
    username: string;
    // 密码
    @Column()
    password: string;
    // 密码版本
    @Column({ default: 1 })
    passwordV: number;
    // 昵称
    @Column({ nullable: true })
    nickName: string;
    // 头像
    @Column({ nullable: true })
    headImg: string;
    // 手机
    @Index()
    @Column({ nullable: true, length: 20 })
    phone: string;
    // 邮箱
    @Column({ nullable: true })
    email: string;
    // 备注
    @Column({ nullable: true, length: 500 })
    remark: string;
    // 状态 0:禁用 1：启用
    @Column({ default: 1, type: 'tinyint' })
    status: number;
}
