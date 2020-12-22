import UIKit

class TableViewController: UIViewController, UITableViewDataSource {
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

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do{
            self.entry = try jsonDecoder.decode([Entry].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
