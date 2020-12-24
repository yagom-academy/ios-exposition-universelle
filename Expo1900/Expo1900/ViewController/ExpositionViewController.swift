import UIKit

class ExpositionViewController: UITableViewController {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var visitorsTextLabel: UILabel!
    @IBOutlet weak var locationTextLabel: UILabel!
    @IBOutlet weak var durationTextLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    var expositionData: Exposition?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeJSONFile()
        assignData()
    }
    
    func decodeJSONFile() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        let dataAssetName: String = "exposition_universelle_1900"
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: dataAssetName) else {
            return
        }
        
        do {
            self.expositionData = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch DecodingError.dataCorrupted(let context) {
            print("데이터가 손상되었거나 유효하지 않습니다.")
            print(context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch DecodingError.keyNotFound(let codingkey, let context) {
            print("주어진 키를 찾을수 없습니다.")
            print(codingkey.intValue ?? Optional(nil)! , codingkey.stringValue , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch DecodingError.typeMismatch(let type, let context) {
            print("주어진 타입과 일치하지 않습니다.")
            print(type.self , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch DecodingError.valueNotFound(let type, let context) {
            print("예상하지 않은 null 값이 발견되었습니다.")
            print(type.self , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch {
            print("그외 에러가 발생했습니다.")
        }
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = UITableView.automaticDimension
        
        return height
    }
}
