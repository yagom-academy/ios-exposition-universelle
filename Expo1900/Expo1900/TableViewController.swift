
import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var koreanExpositionItemList = [KoreaExpositionItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        decodeJSON()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreanExpositionItemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        let koreanExpositionItem: KoreaExpositionItem = koreanExpositionItemList[indexPath.row]
        cell.koreanItemImageView.image = koreanExpositionItem.image
        cell.koreanItemNameLabel.text = koreanExpositionItem.name
        cell.koreanItemShortDescriptionLabel.text = koreanExpositionItem.shortDescription
        
        return cell
    }
    
    // 셀 선택
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pushVC = self.storyboard?.instantiateViewController(identifier: "DetailPage")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
    func decodeJSON() {
        let decoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
          koreanExpositionItemList = try decoder.decode([KoreaExpositionItem].self, from: dataAsset.data)
        } catch {
            print(error)
            return
        }
    }
}
