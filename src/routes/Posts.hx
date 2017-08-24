package routes;
import js.npm.express.Request;
import js.npm.express.Response;
import js.npm.express.Router;

class Posts {
	
	public var router:Router;
	
	public function new() {
		router = new Router();
		router.get('/', function(req:Request, res:Response) {
			var posts = Server.db.idCol(Post);

			res.render('posts', {posts: posts});
		});
	}
	
}