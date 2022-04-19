import UIKit

final class KoreanEntryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var koreanEntryTableView: UITableView!
    private var entries = [Entry]()
    private let cellIdentifier = "EntryCell"
    private let segueIdentifier = "SegueToDetail"
    private let parsingAssistant = ParsingAssistant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        koreanEntryTableView.delegate = self
        koreanEntryTableView.dataSource = self
//        koreanEntryTableView.rowHeight = UITableView.automaticDimension
//        koreanEntryTableView.estimatedRowHeight = 300
        updateEntries()
    }
    
    private func updateEntries() {
        guard let decodedData: [Entry] = parsingAssistant.decodeContent(fileName: "items") else { return }
        entries = decodedData
    }
}

extension KoreanEntryViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.koreanEntryTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? KoreanEntryCell else { return UITableViewCell() }
        cell.configureCell(title: entries[indexPath.row].name, image: entries[indexPath.row].imageName, intro: entries[indexPath.row].introduction)
        
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


