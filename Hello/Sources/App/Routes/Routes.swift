import Vapor
import Foundation


class Book : JSONRepresentable {
    var author:String?
    var title:String?
    var publisher:String?
    init(author:String, title:String, publisher:String) {
        self.author = author
        self.title = title
        self.publisher = publisher
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("info", ["Author":author, "Title":title, "Publisher":publisher])
        return json
    }
}
extension Droplet {
    func setupRoutes() throws {
        
        
        post("upload") { req in
            let imageData = req.formData?["image"]
            
            if imageData != nil {
                let dest = URL(fileURLWithPath: "/Users/michael/Desktop/tmp/penguin.png")
                try Data(imageData!.part.body).write(to: dest)
            }else {
                print("no image data")
            }
            
            var json = JSON()
            try json.set("result","ok")
            return  json
        }
        

        post("search") { req in
            let term = req.json?["term"]?.string
            let country = req.json?["country"]?.string
            return "searching \(term), \(country)"
            
        }
        get("search") { req in
            
            let term = req.query?["term"]?.string
            let country = req.query?["country"]?.string
            
            return "searching \(term) and \(country)"
        }
        
        get("book") { req in
            let book = Book(author: "Michael Pan", title: "Head frist Vapor", publisher: "Zencher")
            return try book.makeJSON()
        }
//        get("hello") { req in
//            var json = JSON()
//            try json.set("hello", "world")
//            return json
//        }
//
//        get("plaintext") { req in
//            return "Hello, world!"
//        }
//
//        // response to requests to /info domain
//        // with a description of the request
//        get("info") { req in
//            return req.description
//        }
//
//        get("description") { req in return req.description }
//
//        try resource("posts", PostController.self)
    }
}
