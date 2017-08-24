package;

class Post{

    public var creator : String;
    public var title : String;
    public var content : String;
    public var link : String;
    public var upCount : Int = 0;
    public var downCount : Int = 0;
    public var id : String = HaxeLow.uuid();

    public function new(title: String, creator : String, content : String, ?link : String = "www.google.com") {
        this.title = title;
        this.creator = creator;
        this.content = content;
        this.link = link;
    }

}