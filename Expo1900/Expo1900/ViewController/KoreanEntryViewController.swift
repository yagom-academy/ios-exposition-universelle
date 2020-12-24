import UIKit

class KoreanEntryViewController: UITableViewController {
    
    var koreanEntryNameData: String?
    var koreanEntryImageData: UIImage?
    var koreanEntryDescriptionsData: String?
    
    @IBOutlet weak var koreanEntryImageView: UIImageView!
    @IBOutlet weak var koreanEntryDescriptionsTextLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        assignData()
    }
    
    func assignData() {
        guard let fetchName = koreanEntryNameData,
              let fetchImage = koreanEntryImageData,
              let fetchDescriptions = koreanEntryDescriptionsData else {
              return
        }
        
        navigationItem.title = fetchName
        koreanEntryImageView.image = fetchImage
        koreanEntryDescriptionsTextLabel.text = fetchDescriptions
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = UITableView.automaticDimension
        
        return height
    }
}
