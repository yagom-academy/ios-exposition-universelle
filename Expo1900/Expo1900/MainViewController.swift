import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var exposition: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = exposition?.title
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do{
            self.exposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
