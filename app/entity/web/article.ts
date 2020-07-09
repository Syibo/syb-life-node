import { Entity, Column } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
* 数据模型描述
*/
@Entity({ name: 'web_article' })
export default class WebArticle extends BaseEntity {
    // 文章标题
    @Column({ nullable: true, length: 150 })
    title: string;
    // 文章链接
    @Column({ nullable: true, length: 150 })
    link: string;
    // 文章内容
    @Column()
    content: string;
    // 文章类型
    @Column()
    artType: string;
}