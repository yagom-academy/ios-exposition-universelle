import UIKit

class CustomButtonStackView: UIStackView {
    @IBOutlet private weak var leftImageView: UIImageView!
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var rightImageView: UIImageView!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    private func setUpView() {
        leftImageView.image = UIImage(named: "flag")
        rightImageView.image = UIImage(named: "flag")
        button.setTitle("한국의 출품작 보러가기", for: .normal)
    }
}
