import UIKit

class ExpositionViewController: UITableViewController {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var visitorsTextLabel: UILabel!
    @IBOutlet weak var locationsTextLabel: UILabel!
    @IBOutlet weak var durationTextLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var expositionData: Exposition?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        let dataAssetName: String = "exposition_universelle_1900"
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: dataAssetName) else { return }
        
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
        
        guard let data = expositionData else { return }
        
        titleTextLabel.text = data.title
        titleImageView.image = data.titleImage
        visitorsTextLabel.text = "방문객 : " + String(data.visitors) + "명"
        locationsTextLabel.text = "개최지 : " + data.location
        durationTextLabel.text = "개최기간 : " + data.duration
        descriptionTextView.text = data.description
    }
}
