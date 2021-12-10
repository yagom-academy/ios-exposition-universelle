
import UIKit

class ItemsViewController: UIViewController {

    @IBOutlet private weak var itemsTableView: UITableView!
    
    var items: [ItemInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        itemsTableView.dataSource = self
        itemsTableView.estimatedRowHeight = 109
        setItems()
    }
    
    private func setTitle() {
        self.title = "한국의 출품작"
    }
    
    private func setItems() {
        do {
            self.items = try Parser.parsedItemsInfo()
        } catch let error {
            showAlert(message: error.localizedDescription)
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell: ItemTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "itemCell") as! ItemTableViewCell
        let item: ItemInfo = self.items[indexPath.row]
        itemCell.itemImageView.image = UIImage(named: "\(item.imageName)")
        itemCell.itemTitleLabel.text = item.name
        itemCell.itemDescriptionLabel.text = item.shortDescription
        
        return itemCell
    }
}
