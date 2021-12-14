import UIKit

class TableViewController: UITableViewController {
    @IBOutlet weak var entryListTableView: UITableView!
    var entryData = [Entry]()
    
    override func viewDidLoad() {
        decodedEntryData()
        super.viewDidLoad()
    }
}

// MARK: - Table view data source
extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = entryListTableView.dequeueReusableCell(withIdentifier: "entryCustomCell", for: indexPath)
        
        if let customCell = cell as? EntryCustomTableViewCell {
            customCell.entryNameLabel.text = entryData[indexPath.row].name
            customCell.entryImageView.image = UIImage(named: entryData[indexPath.row].imageResourceLocator)
            customCell.entryShortDescriptionLabel.text = entryData[indexPath.row].simpleDescription
            
            return customCell
        }
        
        return cell
    }
    
    func decodedEntryData() {
        do {
            entryData = try parseEntryJSON()
        } catch ExpositionError.notExistData {
            print(ExpositionError.notExistData)
        } catch ExpositionError.failJSONParsing {
            print(ExpositionError.failJSONParsing)
        } catch {
            print(error)
        }
    }
}

// MARK: - Table view delegation
extension TableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(180)
    }
}
