package routes;

import js.Node;
import js.npm.express.Request;
import js.npm.express.Response;
import js.npm.express.Router;

/**
 * Users
 * @author TiagoLr
 */
class Index {
	
	public var router:Router;
	
	public function new() {
		router = new Router();
		
		router.get('/', function(req:Request, res:Response) {
			res.render("index.pug", {
				title: "Index",
				message: "Index of AnswerHub"
			});
		});
	}
	
}