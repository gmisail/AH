package;

import js.Error;
import js.Node;
import js.node.Path;
import js.npm.Express;
import js.npm.express.BodyParser;
import js.npm.express.Request;
import js.npm.express.Response;
import js.npm.express.Static;

import haxe.Json;

import routes.*;

/**
 * ...
 * @author TiagoLr
 */

class Server {
	
	public static var db : HaxeLow;

	static function main() {
		var port = 8000;
		var app = new Express();
		var dirname = Node.__dirname;
	
		app.set('view engine', 'pug');

		app.use(BodyParser.urlencoded({extended: false}));
		app.use(BodyParser.json());
		app.use(new Static(Path.join(dirname, 'public')));
		
		db = new HaxeLow("db.json");
		
		db.save();

		app.use('/', new Index().router);
		app.use('/posts', new Posts().router);
		app.use('/create', new Create().router);

		app.post('/newpost', function (req, res) {
			var creator = untyped __js__("req.body.creator");
			var title = untyped __js__("req.body.title");
  			var content = untyped __js__("req.body.content");

			if(creator != "" && title != "" && content != ""){
				var posts = db.idCol(Post);
				posts.idInsert(new Post(title, creator, content));
				db.save();
			}
		});

		app.use(function(err, req, res, next) {
			trace(err.toString());
		});

		
		
		trace('starting server on port $port');
		app.listen(port);
	}
}