import UIKit

struct Parser {
    
    var expoData: Exposition? {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return nil
        }
        
        var expo : Exposition?
        
        do {
            expo = try JSONDecoder().decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        guard let validExpoData = expo else {
            return nil
        }
        return validExpoData
    }
    
    var items: [KoreanItem] {
        guard let dataAsset = NSDataAsset(name: "items") else {
            return []
        }
        
        var items: [KoreanItem] = []
        
        do {
            items = try JSONDecoder().decode([KoreanItem].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        return items
    }
}
