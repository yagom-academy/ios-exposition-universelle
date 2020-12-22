import UIKit

class TableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIndentifier: String = "cell"
    var entries: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func decodeData() {
        guard let dataAsset = NSDataAsset(name: "items") else { return }
        let jsonDecoder = JSONDecoder()
        
        do {
            self.entries = try jsonDecoder.decode([Entry].self, from: dataAsset.data)
        } catch {
            debugPrint("ERROR")
        }
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let detailView = segue.destination as? DetailViewController else { return }
        detailView.entry = entries[indexPath.row]
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  cellIndentifier, for: indexPath)
        let entry = entries[indexPath.row]
        var content = cell.defaultContentConfiguration()

        content.image = entry.image
        content.text = entry.name
        content.secondaryText = entry.shortDescription
        cell.contentConfiguration = content
        return cell
    }
}
