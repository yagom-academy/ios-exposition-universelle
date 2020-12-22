import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    let cellIdentifier: String = "cell"
    var exposition: Exposition?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // 동적으로 표현하는 방법이 뭐가 있을까?
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let exposition: Exposition = self.exposition!
        
        cell.textLabel?.text = exposition.title
        cell.imageView?.image = UIImage(named: "poster")
        cell.detailTextLabel?.text = "방문객 : " + String(exposition.visitors)
//        cell.detailTextLabel?.text = "개최지 : " + exposition.location
        
        return cell
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do{
            self.exposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
