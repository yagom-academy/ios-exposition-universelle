
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorValueLabel: UILabel!
    @IBOutlet private weak var locationValueLabel: UILabel!
    @IBOutlet private weak var durationValueLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewsToDefault()
        self.navigationController?.navigationBar.topItem?.title = "메인"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setViewsToDefault() {
        do {
            let data = try Parser.parsedExpoInfo()
            titleLabel.text = data.formattedTitle
            visitorValueLabel.text = data.formattedVisitors
            locationValueLabel.text = data.location
            durationValueLabel.text = data.duration
            titleLabel.font = UIFont.systemFont(ofSize: 28)
            setTextViewToDefault(with: data.description)
        } catch let error {
            showAlert(message: error.localizedDescription)
        }
    }
    
    private func setTextViewToDefault(with data: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakStrategy = .hangulWordPriority
        let attribute: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17),
            .paragraphStyle: paragraphStyle]
        descriptionTextView.attributedText = NSAttributedString(
            string: data.description,
            attributes: attribute)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
