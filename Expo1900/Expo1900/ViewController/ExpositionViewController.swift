import UIKit

class ExpositionViewController: UITableViewController {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var visitorsTextLabel: UILabel!
    @IBOutlet weak var locationTextLabel: UILabel!
    @IBOutlet weak var durationTextLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    var expositionData: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let decodeJSON: DecodeJSON = DecodeJSON()
        
        if let decodedData = decodeJSON.decodeJSONFile(fileName: "exposition_universelle_1900", type: Exposition.self) {
            expositionData = decodedData
        }
        assignData()
    }
    
    func assignData() {
        guard let data = expositionData else {
            return
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let formattedVisitors = numberFormatter.string(from: NSNumber(value: data.visitors)) else {
            return
        }
        
        var numberOfVisitors: String {
            return "방문객 : \(formattedVisitors) 명"
        }
        
        titleTextLabel.text = data.title
        titleImageView.image = data.titleImage
        visitorsTextLabel.text = numberOfVisitors
        locationTextLabel.text = data.expositionLocation
        durationTextLabel.text = data.expositionDuration
        descriptionTextLabel.text = data.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
        appDelegate.shouldSupportAllOrientation = UIInterfaceOrientationMask.portrait
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
        appDelegate.shouldSupportAllOrientation = UIInterfaceOrientationMask.all
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = UITableView.automaticDimension
        
        return height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
