import UIKit

class KoreanEntryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var koreanEntryTableView: UITableView!
    private var entries = [Entry]()
    private let cellIdentifier = "EntryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        koreanEntryTableView.delegate = self
        koreanEntryTableView.dataSource = self
        
        guard let decodedData = parseJSON() else { return }
        entries = decodedData
    }

    private func parseJSON() -> [Entry]? {
        let decoder = JSONDecoder()
        guard let asset = NSDataAsset(name: "items") else { return nil }
        let data = try? decoder.decode([Entry].self, from: asset.data)
        return data
    }
}

extension KoreanEntryViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.koreanEntryTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = entries[indexPath.row].name
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
        
        cell.imageView?.image = UIImage(named: entries[indexPath.row].imageName)
        cell.imageView?.contentMode = .scaleAspectFit
        
        cell.detailTextLabel?.text = entries[indexPath.row].introduction
        cell.detailTextLabel?.numberOfLines = 0
        
        return cell
    }
}

