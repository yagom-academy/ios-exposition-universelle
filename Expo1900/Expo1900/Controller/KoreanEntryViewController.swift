import UIKit

class KoreanEntryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var koreanEntryTableView: UITableView!
    private var entries = [Entry]()
    private let cellIdentifier = "EntryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }    
}

extension KoreanEntryViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.koreanEntryTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = entries[indexPath.row].name
        cell.imageView?.image = UIImage(named: entries[indexPath.row].imageName)
        cell.detailTextLabel?.text = entries[indexPath.row].introduction
        return cell
    }
}

