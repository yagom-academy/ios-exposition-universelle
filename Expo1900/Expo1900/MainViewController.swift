import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    let cellIdentifier: String = "cell"
    var exposition: [Exposition] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exposition.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let exposition: Exposition = self.exposition[indexPath.row]
        
        cell.textLabel?.text = exposition.title
        
        return cell
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do{
            self.exposition = try jsonDecoder.decode([Exposition].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
