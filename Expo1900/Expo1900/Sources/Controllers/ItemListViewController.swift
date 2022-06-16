import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet weak var itemTableView: UITableView!

    private var contents: [Content] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTableView.dataSource = self
        itemTableView.rowHeight = 150

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

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItemCell ?? ItemCell()
        let currentContent = contents[indexPath.row]
        
        cell.descriptionLabel.numberOfLines = 0
        cell.titleLabel.font = .preferredFont(forTextStyle: .title2)
        cell.accessoryType = .disclosureIndicator
        
        cell.itemImageView.image = UIImage(named: currentContent.imageName)
        cell.titleLabel.text = currentContent.name
        cell.descriptionLabel.text = currentContent.shortDescription
        
        return cell
    }
}
