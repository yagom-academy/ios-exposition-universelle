import UIKit

class InformationStackView: UIStackView {
    @IBOutlet private weak var titleLabel: DynamicTypeLabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: DynamicTypeLabel!
    @IBOutlet private weak var locationLabel: DynamicTypeLabel!
    @IBOutlet private weak var durationLabel: DynamicTypeLabel!
    @IBOutlet private weak var descriptionLabel: DynamicTypeLabel!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpStackViewSpacing()
        setUpLabelAlignment()
        setUpLabelTextLines()
        setUpLabelFont()
    }

    func setUpView(from data: ExpoInformation) {
        titleLabel.text = data.title
        posterImageView.image = UIImage(named: "poster")
        if let visitors = DecimalNumberFormatter.string(for: data.visitors) {
            visitorsLabel.text = "방문객 : " + visitors + " 명"
        }
        locationLabel.text = "개최지 : " + data.location
        durationLabel.text = "개최 기간 : " + data.duration
        descriptionLabel.text = data.description
    }
    
    private func setUpStackViewSpacing() {
        spacing = 10
    }
    
    private func setUpLabelAlignment() {
        titleLabel.textAlignment = .center
        visitorsLabel.textAlignment = .center
        locationLabel.textAlignment = .center
        durationLabel.textAlignment = .center
    }
    
    private func setUpLabelTextLines() {
        titleLabel.numberOfLines = 2
        visitorsLabel.numberOfLines = 0
        locationLabel.numberOfLines = 0
        durationLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
    }
    
    private func setUpLabelFont() {
        titleLabel.setUpFont(forTextStyle: .title1)
        visitorsLabel.setUpFont(forTextStyle: .body)
        locationLabel.setUpFont(forTextStyle: .body)
        durationLabel.setUpFont(forTextStyle: .body)
        descriptionLabel.setUpFont(forTextStyle: .body)
    }
}
