import UIKit

class ItemListViewController: UIViewController {

    private var contents: [Content] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            contents = try decodeContentData()
        } catch let error as DataHandlingError {
            print(error.description)
        } catch {
            print("Undexpected error: \(error)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func decodeContentData() throws -> [Content] {
        guard let koreanItems = NSDataAsset.init(name: "items") else { throw DataHandlingError.invalidFile }
        
        let jsonDecoder = JSONDecoder()
        let contents = try jsonDecoder.decode([Content].self, from: koreanItems.data)
        
        return contents
    }
    
}
