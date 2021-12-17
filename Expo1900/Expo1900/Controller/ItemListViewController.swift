import UIKit

class ItemListViewController: UIViewController {
    private var items = [ExpositionItem]()
    @IBOutlet private weak var itemListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        itemListTableView.delegate = self
        itemListTableView.dataSource = self
        registerNib()
        parsing()
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let item = sender as? ExpositionItem,
              let nextViewController = segue.destination as? ItemDetailViewController else {
            showAlert(message: "데이터 전달에 실패했습니다.")
            return
        }
        nextViewController.setModel(item)
    }
}

extension ItemListViewController {
    private func setUpNavigationBar() {
        self.navigationItem.title = "한국의 출품작"
    }
    
    private func parsing() {
        let parsedResult = JSONParser<[ExpositionItem]>().decode(fileName: FileName.items)
        
        switch parsedResult {
        case .failure(let parsingError):
            showAlert(message: parsingError.errorDescription ?? "알 수 없는 에러가 발생했습니다.")
        case .success(let contents):
            items = contents
        }
    }
    
    private func registerNib() {
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        itemListTableView.register(nib, forCellReuseIdentifier: "ItemTableViewCell")
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell else {
            fatalError("Can not find Cell")
        }
        guard let item = items[index: indexPath.row] else {
            fatalError()
        }
        cell.setModel(item)
        
        return cell
    }
}

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ItemDetailView", sender: items[index: indexPath.row])
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

