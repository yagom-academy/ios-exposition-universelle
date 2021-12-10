
import UIKit

class ItemsViewController: UIViewController {

    @IBOutlet private weak var itemsTableView: UITableView!
    
    var items: [ItemInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        itemsTableView.dataSource = self
        itemsTableView.delegate = self
        itemsTableView.estimatedRowHeight = 109
        setItems()
    }
}

// MARK: - Private Method

extension ItemsViewController {
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

// MARK: - TableViewDataSource Method

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let itemCell = tableView.dequeueReusableCell(
                withIdentifier: "itemCell") as? ItemTableViewCell else {
            return ItemTableViewCell()
        }
        let item: ItemInfo = self.items[indexPath.row]
        itemCell.itemImageView.image = UIImage(named: "\(item.imageName)")
        itemCell.itemTitleLabel.text = item.name
        itemCell.itemDescriptionLabel.text = item.shortDescription
        
        return itemCell
    }
}

// MARK: - TableViewDelegate Method

extension ItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController =
                storyboard?.instantiateViewController(identifier: "itemDetail", creator: { coder in
            return ItemDetailViewController(coder: coder, data: self.items[indexPath.row])
        }) else {
            return
        }
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
