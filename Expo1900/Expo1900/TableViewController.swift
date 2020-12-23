import UIKit

class TableViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    var entry: [Entry] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let entry: Entry = self.entry[indexPath.row]
        cell.imageView?.image = entry.image
        cell.textLabel?.text = entry.name
        cell.detailTextLabel?.text = entry.shortDescription
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "한국의 출품작"
        self.navigationController?.isNavigationBarHidden = false
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do{
            self.entry = try jsonDecoder.decode([Entry].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getIndexPathForSelectedCell() -> Int {
        var indexPath: NSIndexPath?
        if tableView.indexPathsForSelectedRows!.count > 0 {
            indexPath = (tableView.indexPathsForSelectedRows?[0])! as NSIndexPath
        }
        return indexPath!.row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index: Int = getIndexPathForSelectedCell()
        if let dest = segue.destination as? DetailViewController {
            dest.myEntry = entry[index]
        }
    }
}
