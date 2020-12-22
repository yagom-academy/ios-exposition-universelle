import UIKit

class DetailViewController: UIViewController {
    var entry: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do{
            self.entry = try jsonDecoder.decode([Entry].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
