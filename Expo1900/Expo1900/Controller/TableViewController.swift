import UIKit

class TableViewController: UITableViewController {
    @IBOutlet weak var entryListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Table view data source
extension TableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // 임시 값
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = entryListTableView.dequeueReusableCell(withIdentifier: "entryCustomCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
   
        return cell
    }
    
    func decodedEntryData() throws -> [Entry] {
        guard let entryData = try parseEntryJSON() else {
            throw ExpositionError.failJSONParsing
        }
        
        return entryData
    }
}

// MARK: - Table view delegation
extension TableViewController {
    
}
