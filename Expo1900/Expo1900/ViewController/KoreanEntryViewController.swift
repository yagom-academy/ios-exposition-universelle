import UIKit

class KoreanEntryViewController: UITableViewController {
    
    var fetchData: KoreanEntries?
    
    @IBOutlet weak var koreanEntryImageView: UIImageView!
    @IBOutlet weak var koreanEntryDescriptionsTextLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        assignData()
    }
    
    func assignData() {
        guard let fetchData = self.fetchData else { return }

        navigationItem.title = fetchData.name
        koreanEntryImageView.image = fetchData.image
        koreanEntryDescriptionsTextLabel.text = fetchData.descriptions
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = UITableView.automaticDimension
        
        return height
    }
}
