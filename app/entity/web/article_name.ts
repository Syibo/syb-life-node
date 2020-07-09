import { Entity, Column } from 'typeorm';
import { BaseEntity } from 'egg-cool-entity';

/**
* 数据模型描述
*/
@Entity({ name: 'web_article_name' })
export default class WebArticleName extends BaseEntity {
    // 文章标题
    @Column({ nullable: true, length: 50 })
    artName: string;
}