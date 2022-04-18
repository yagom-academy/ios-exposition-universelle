import UIKit

final class KoreanEntryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var koreanEntryTableView: UITableView!
    private var entries = [Entry]()
    private let cellIdentifier = "EntryCell"
    private let segueIdentifier = "SegueToDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        koreanEntryTableView.delegate = self
        koreanEntryTableView.dataSource = self
        updateEntries()
    }
    
    private func updateEntries() {
        guard let decodedData = decodeEntryItems() else { return }
        entries = decodedData
    }

    private func decodeEntryItems() -> [Entry]? {
        let decoder = JSONDecoder()
        guard let items = NSDataAsset(name: "items") else { return nil }
        let data = try? decoder.decode([Entry].self, from: items.data)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            guard let cell = sender as? UITableViewCell else { return }
            guard let indexPath = self.koreanEntryTableView.indexPath(for: cell) else { return }
            
            let entryDetailViewController = segue.destination as? EntryDetailViewController
            let detailContent = DetailContent(detailDescription: entries[indexPath.row].description,
                                              imageName: entries[indexPath.row].imageName,
                                              koreanEntryTitle: entries[indexPath.row].name)
            entryDetailViewController?.updateDetailContent(data: detailContent)
        }
    }
}

