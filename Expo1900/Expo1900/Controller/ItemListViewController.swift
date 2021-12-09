import UIKit

class ItemListViewController: UIViewController {
    private var items = [ExpositionItem]()
    @IBOutlet weak var itemListTableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "한국의 출품작"
        itemListTableVIew.delegate = self
        itemListTableVIew.dataSource = self
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        itemListTableVIew.register(nib, forCellReuseIdentifier: "ItemTableViewCell")
        parsing()
    }
    
    func parsing() {
        let parsedResult = JSONParse<[ExpositionItem]>.decode(fileName: "items")
        
        switch parsedResult {
        case .failure(let parsingError):
            showAlert(message: parsingError.errorDescription ?? parsingError.localizedDescription)
        case .success(let contents):
            items = contents
        }
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        cell.itemImageView.image = UIImage(named: item.imageName)
        cell.itemNameLabel.text = item.name
        cell.itemShortDescriptionLabel.text = item.shortDescription
        
        return cell
    }
}

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ItemDetailView", sender: nil)
    }
}
