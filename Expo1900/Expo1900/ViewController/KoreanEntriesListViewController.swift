import UIKit

class KoreanEntriesListViewController: UITableViewController {
    
    var koreanEntries: [KoreanEntries] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let koreanDecodeJSON: DecodeJSON = DecodeJSON()
        
        if let koreanDecodedData = koreanDecodeJSON.decodeJSONFile(fileName: "items", type: [KoreanEntries].self) {
            koreanEntries = koreanDecodedData
        }
        
        self.tableView.reloadData()
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.koreanEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? KoreanEntriesTableViewCell else {
            return UITableViewCell()
        }

        let entry: KoreanEntries = self.koreanEntries[indexPath.row]

        cell.setData(item: entry)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let koreanEntryViewController = storyboard?.instantiateViewController(identifier: "KoreanEntryViewController") as? KoreanEntryViewController else {
            print("해당 뷰 컨트롤러가 없습니다.")
            return
        }

        let selectedEntry: KoreanEntries = self.koreanEntries[indexPath.row]
        
        koreanEntryViewController.fetchData = selectedEntry

        navigationController?.pushViewController(koreanEntryViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
