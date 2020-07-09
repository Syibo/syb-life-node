import { Entity, Column } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
* 数据模型描述
*/
@Entity({ name: 'web_contact' })
export default class WebContact extends BaseEntity {
    // 标题
    @Column()
    name: string;
    //图片
    @Column()
    content: string;
    // 内容
    @Column()
    contact: string;
}