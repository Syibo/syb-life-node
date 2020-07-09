import { BaseController } from 'egg-cool-controller';
import router from 'egg-cool-router';

/**
* 控制器功能描述
*/
@router.prefix('/admin/web/article', ['add', 'delete', 'update', 'info', 'list', 'page'])
export default class WebArticleController extends BaseController {
    init() {
        this.setEntity(this.ctx.repo.web.Article);
        this.setPageOption({
            keyWordLikeFields: [ 'artType', 'title' ],
        });
    }
    /**
    * 测试接口
    */
    @router.get('/test')
    async test() {
        // await this.OpService.xxx(this.getBody());
        console.log(this.getQuery());
        console.log(this.getQuery().name);
        let data = await this.ctx.service.web.article.testSql(this.getQuery().name);
        console.log(data);
        this.res({ data });
    }

    /**
    * 其他接口
    */
    @router.get('/artNum')
    async artNum() {
       let data = await this.ctx.service.web.article.artNum();
       this.res({ data });
    }

    /**
    * 其他接口
    */
   @router.get('/home')
   async getHome() {
      let data = await this.ctx.service.web.article.getHome();
      this.res({ data });
   }
}