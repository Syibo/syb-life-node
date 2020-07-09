import { Entity, Column } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
* 数据模型描述
*/
@Entity({ name: 'web_diary' })
export default class WebDiary extends BaseEntity {
    // 日记标题
    @Column({ nullable: true, length: 150 })
    title: string;
    // 日记地址
    @Column({ nullable: true, length: 150 })
    place: string;
    // type
    @Column()
    type: string;
    // link
    @Column()
    link: string;
    // 日记图片
    @Column()
    picture: string;
    // 日记内容
    @Column()
    content: string;
}