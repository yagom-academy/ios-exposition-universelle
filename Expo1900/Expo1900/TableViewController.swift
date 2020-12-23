
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
        let pushVC = self.storyboard?.instantiateViewController(identifier: "DetailViewController")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
    // 데이터 보내기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else {
            return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        guard let itemIndex: IndexPath = self.tableView.indexPath(for: cell) else {
            return
        }
        
        detailVC.itemName = koreanExpositionItemList[itemIndex.row].name
        detailVC.itemImage = koreanExpositionItemList[itemIndex.row].image
        detailVC.itemDescription = koreanExpositionItemList[itemIndex.row].description
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
