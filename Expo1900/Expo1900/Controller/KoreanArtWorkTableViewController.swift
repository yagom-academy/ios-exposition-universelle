import UIKit

class KoreanArtWorkTableViewController: UITableViewController {
    
    var expositionItem: [ExpositionItem]?
    let defaultSectionCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let decodedData = JsonParser.decodeData(of: "items", how: [ExpositionItem].self)
        expositionItem = decodedData
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let cell = sender as? KoreanArtWorkTableViewCell else { return }
       
        if let destinationVC = segue.destination as? aaaViewController {
            let id = tableView.indexPath(for: cell)?.row
            destinationVC.id = id
        }
        
    }

}

extension KoreanArtWorkTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return defaultSectionCount
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItem?.count ?? .zero
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "artWorkItem"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath)
        
        if let cell = cell as? KoreanArtWorkTableViewCell {
            cell.titleLabel.text = expositionItem?[indexPath.row].name ?? ""
            cell.detailLabel.text = expositionItem?[indexPath.row].shortDescription ?? ""
            cell.imageViewLabel.image = UIImage(named: expositionItem?[indexPath.row].imageName ?? "")
        }
        
        return cell
    }
    
}
