
import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var koreanExpositionItemList = [KoreaExpositionItem]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // 추상화가 필요할지에 대한 고민.
        
        setNavigationBar() // 한 줄짜리 함수에 대한 고민.
        decodeJSON()
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreanExpositionItemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "koreanItemCell", for: indexPath) as? KoreanItemCell else {
            return UITableViewCell()
        }
        
        let koreanExpositionItem: KoreaExpositionItem = koreanExpositionItemList[indexPath.row]
        cell.koreanItemImageView.image = koreanExpositionItem.image
        cell.koreanItemNameLabel.text = koreanExpositionItem.name
        cell.koreanItemShortDescriptionLabel.text = koreanExpositionItem.shortDescription
        
        return cell
    }
    
    // 셀 선택했을 때 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let pushVC = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {
            showErrorAlert(message: "알 수 없는 에러!")
            return
        }
        self.navigationController?.pushViewController(pushVC, animated: true)
        // VC 줄여서 쓰는 것을 지양하자.
        pushVC.itemName = koreanExpositionItemList[indexPath.row].name
        pushVC.itemDescription = koreanExpositionItemList[indexPath.row].description
        pushVC.itemImage = koreanExpositionItemList[indexPath.row].image
    }
    
    func decodeJSON() {
        let decoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            showErrorAlert(message: "JSON 디코딩 불가!")
            return
        }
        
        do {
          koreanExpositionItemList = try decoder.decode([KoreaExpositionItem].self, from: dataAsset.data)
        } catch {
            showErrorAlert(message: "JSON 디코딩 불가!")
            return
        }
    }
    
    func setNavigationBar() {
        navigationItem.title = "한국의 출품작"
    }
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let OKButton = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(OKButton)
        present(alert, animated: true, completion: nil)
    }
}
