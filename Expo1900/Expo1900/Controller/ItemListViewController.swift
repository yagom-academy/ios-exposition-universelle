import UIKit

class ItemListViewController: UIViewController {
    private var items = [ExpositionItem]()
    @IBOutlet private weak var itemListTableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        itemListTableVIew.delegate = self
        itemListTableVIew.dataSource = self
        registerNib()
        parsing()
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let item = sender as? ExpositionItem,
              let nextViewController = segue.destination as? ItemDetailViewController else {
            return
        }
        nextViewController.item = item
    }
}

extension ItemListViewController {
    private func setUpNavigationBar() {
        self.navigationItem.title = "한국의 출품작"
    }
    
    private func parsing() {
        let parsedResult = JSONParse<[ExpositionItem]>.decode(fileName: FileName.items)
        
        switch parsedResult {
        case .failure(let parsingError):
            showAlert(message: parsingError.errorDescription ?? parsingError.localizedDescription)
        case .success(let contents):
            items = contents
        }
    }
    
    private func registerNib() {
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        itemListTableVIew.register(nib, forCellReuseIdentifier: "ItemTableViewCell")
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
        configure(of: cell, by: item)
        
        return cell
    }
    
    private func configure(of cell: ItemTableViewCell, by item: ExpositionItem) {
        cell.itemImageView.image = UIImage(named: item.imageName)
        cell.itemNameLabel.text = item.name
        cell.itemShortDescriptionLabel.text = item.shortDescription
    }
}

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ItemDetailView", sender: items[indexPath.row])
    }
}
