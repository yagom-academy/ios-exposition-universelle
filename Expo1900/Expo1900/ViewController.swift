import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    private var expoData: Exposition?
    
    //MARK: - IBOutlets
    @IBOutlet private weak var expoTitle: UITextView!
    @IBOutlet private weak var expoPoster: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var expoDescription: UITextView!
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonDecoder = JSONDecoder()
        
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            expoData = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        guard let validExpoData = expoData else {
            return
        }
        
        expoTitle.text = validExpoData.title
        visitorsLabel.text = "방문객 : \(validExpoData.formattedVisitors) 명"
        locationLabel.text = "개최지 : \(validExpoData.location)"
        durationLabel.text = "개최 기간 : \(validExpoData.duration)"
        expoDescription.text = validExpoData.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden.toggle()
    }
}

