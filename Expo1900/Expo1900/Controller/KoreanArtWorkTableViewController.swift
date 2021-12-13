import UIKit

class KoreanArtWorkTableViewController: UITableViewController {
    
    var expositionItem: [ExpositionItem]?
    let defaultSectionCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        guard let data = NSDataAsset(name: "items") else {
            fatalError()
        }
    
        let decoder = JSONDecoder()
        
        do {
            expositionItem = try decoder.decode([ExpositionItem].self, from: data.data)
            
        } catch {
            print(error.localizedDescription)
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
        var content = cell.defaultContentConfiguration()
        content.text = expositionItem?[indexPath.row].name ?? ""
        content.secondaryText = expositionItem?[indexPath.row].shortDescription ?? ""
        content.image = UIImage(named: expositionItem?[indexPath.row].imageName ?? "")
        cell.contentConfiguration = content
        return cell
    }
    
}
