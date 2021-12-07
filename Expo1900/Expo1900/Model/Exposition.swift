import UIKit

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    init() {
        do {
            guard let data = NSDataAsset(name: "exposition_universelle_1900") else {
                //TODO: throw Error
                self.title = ""
                self.visitors = 1
                self.location = ""
                self.duration = ""
                self.description = ""
                return
            }
            
            let exposition = try JSONDecoder.shared.decode(Exposition.self, from: data.data)

            self = exposition
//            self.title = exposition.title
//            self.visitors = exposition.visitors
//            self.location = exposition.location
//            self.duration = exposition.duration
//            self.description = exposition.description

        } catch {
            print(error)
            self.title = ""
            self.visitors = 1
            self.location = ""
            self.duration = ""
            self.description = ""
        }
    }
}
