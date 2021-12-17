import UIKit

class InformationStackView: UIStackView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private let stackViewSpacing: CGFloat = 10
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpAccessibilty()
        setUpStackViewSpacing()
        setUpLabelAlignment()
        setUpLabelTextLines()
        setUpLabelFont()
    }

    func setUpView(from informationData: ExpoInformation) {
        let colon = ":"
        let visitor = "방문객"
        let location = "개최지"
        let duration = "개최 기간"
        let peopleCountSymbol = "명"
        
        titleLabel.text = informationData.title.replacingOccurrences(of: "(", with: "\n(")
        posterImageView.image = UIImage(named: "poster")
        if let visitors = DecimalNumberFormatter.string(for: informationData.visitors) {
            let visitorsAttributedText = NSMutableAttributedString()
                .setTextSize(string: visitor, fontSize: .title3)
                .setTextSize(string: " \(colon) \(visitors) \(peopleCountSymbol)" , fontSize: .body)
            visitorsLabel.attributedText = visitorsAttributedText
        }
        
        let locationAttributedText = NSMutableAttributedString()
                                        .setTextSize(string: location, fontSize: .title3)
                                        .setTextSize(string: " \(colon) \(informationData.location)" , fontSize: .body)
        locationLabel.attributedText = locationAttributedText
        
        let durationAttributedText = NSMutableAttributedString()
                                        .setTextSize(string: duration, fontSize: .title3)
                                        .setTextSize(string: " \(colon) \(informationData.duration)" , fontSize: .body)
        durationLabel.attributedText = durationAttributedText
        
        descriptionLabel.text = informationData.description
    }
    
    private func setUpAccessibilty() {
        posterImageView.isAccessibilityElement = true
        posterImageView.accessibilityLabel = "파리 만국박람회 포스터"
    }
    
    private func setUpStackViewSpacing() {
        spacing = stackViewSpacing
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
        titleLabel.setUpDynamicFont(forTextStyle: .title1)
        visitorsLabel.setUpDynamicFont(forTextStyle: .body)
        locationLabel.setUpDynamicFont(forTextStyle: .body)
        durationLabel.setUpDynamicFont(forTextStyle: .body)
        descriptionLabel.setUpDynamicFont(forTextStyle: .body)
    }
}
