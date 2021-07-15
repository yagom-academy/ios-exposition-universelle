import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var expoTitle: UILabel!
    @IBOutlet private weak var expoPoster: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var expoDescription: UILabel!
    
    //MARK: - Properties
    private var expoData: Exposition?
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        let expoData = Parser().expoData
        guard let validExpoData = expoData else {
            return
        }
        configureCells(validExpoData)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        appDelegate?.shouldSetPortraitOrientation = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden.toggle()
        appDelegate?.shouldSetPortraitOrientation = false
    }
    
    //MARK:- Methods
    private func configureCells(_ validExpoData: Exposition) {
        visitorsLabel.text = "방문객 : \(validExpoData.formattedVisitors) 명"
        locationLabel.text = "개최지 : \(validExpoData.location)"
        durationLabel.text = "개최 기간 : \(validExpoData.duration)"
        expoDescription.text = validExpoData.description
    }
}

