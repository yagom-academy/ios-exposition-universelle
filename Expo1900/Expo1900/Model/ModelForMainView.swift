import UIKit

struct ModelForMainView {
    var title: String
    var image: UIImage
    var visitors: String
    var location: String
    var duration: String
    var description: String
    
    init(title: String = "", image: UIImage = UIImage(), visitors: String = "", location: String = "", duration: String = "", description: String = "") {
        self.title = title
        self.image = image
        self.visitors = visitors
        self.location = location
        self.duration = duration
        self.description = description
    }
    
    mutating func setUpData() {
        let expositionIdentifier = "exposition_universelle_1900"
        let data = JsonParser.decodeData(of: expositionIdentifier, how: Exposition.self)
        title = data.title.replacingOccurrences(of: "(", with: "\n(")
        visitors = "방문객 : " + data.visitor + "명"
        location = "개최지 : " + data.location
        duration = "개최 기간 : " + data.duration
        description = data.description
        image = UIImage(named: "poster")!
    }
    
}
