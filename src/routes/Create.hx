package routes;

import js.Node;
import js.npm.express.Request;
import js.npm.express.Response;
import js.npm.express.Router;

class Create{

    public var router:Router;
	
	public function new() {
		router = new Router();
		
		router.get('/', function(req:Request, res:Response) {
			res.render("create.pug");
		});
	}

}