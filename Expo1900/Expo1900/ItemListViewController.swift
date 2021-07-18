import UIKit

class ItemListViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Properties
    private var itemList = Parser().items
    private let koreanEntry = "한국의 출품작"
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = koreanEntry
        let backBarButtonItem = UIBarButtonItem(title: koreanEntry, style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    //MARK: - Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowItemDetailSegue",
           let destination = segue.destination as? DetailViewController,
           let cell  = sender as? ItemListCell,
           let indexPath = tableView.indexPath(for: cell) {
            let itemData = itemList[indexPath.row]
            destination.getParsedData(with: itemData)
        }
    }
}

extension ItemListViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: - Protocol Requirements
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ItemListCell.self), for: indexPath) as? ItemListCell else {
            return UITableViewCell()
        }
        
        let item = itemList[indexPath.row]
        cell.configureCell(item)
        return cell
    }
}
