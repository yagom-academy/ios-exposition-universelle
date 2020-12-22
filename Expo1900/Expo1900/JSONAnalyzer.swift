import UIKit

struct JSONAnalyzer {
    func readFile<T: Decodable>(forName name: String, _ type: T.Type) -> T? {
        guard let dataAsset = NSDataAsset(name: name) else {
            return nil
        }
        
        return decodeJSONFile(data: dataAsset.data)
    }
    
    private func decodeJSONFile<T: Decodable>(data: Data) -> T?{
        let jsonDecode = JSONDecoder()
        
        do {
            let decodedData = try jsonDecode.decode(T.self, from: data)
            return decodedData
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
