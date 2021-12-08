import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parsing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func parsing() {
        let expoFileName = "exposition_universelle_1900"
        let parsedResult = JSONParse<Exposition>.decode(fileName: expoFileName)
        
        switch parsedResult {
        case .failure(let parsingError):
            showAlert(message: parsingError.errorDescription ?? parsingError.localizedDescription)
            return
        case .success(let contents):
            setUpView(contents: contents)
        }
    }
    
    func setUpView(contents: Exposition) {
        let colon = ": "
        let people = " 명"
        
        titleLabel.text =  contents.title
        visitorsLabel.text = CategoryPrefix.visitor + colon + contents.visitorsDescription + people
        locationLabel.text = CategoryPrefix.location + colon + contents.location
        durationLabel.text = CategoryPrefix.duration + colon + contents.duration
        descriptionLabel.text = contents.description
        posterImageView.image = UIImage(named: "poster")
        
        editFontSize(of: CategoryPrefix.visitor, in: visitorsLabel)
        editFontSize(of: CategoryPrefix.location, in: locationLabel)
        editFontSize(of: CategoryPrefix.duration, in: durationLabel)
    }
    
    func editFontSize(of prefix: String ,in label: UILabel) {
        guard let text = label.text else {
            return
        }
        let fontSize = UIFont.systemFont(ofSize: label.font.pointSize + 3)
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: prefix)
        attributedString.addAttribute(.font, value: fontSize, range: range)
        label.attributedText = attributedString
    }
}
