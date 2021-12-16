import UIKit

class InformationStackView: UIStackView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
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

    func setUpView(from data: ExpoInformation) {        
        titleLabel.text = data.title.replacingOccurrences(of: "(", with: "\n(")
        posterImageView.image = UIImage(named: "poster")
        if let visitors = DecimalNumberFormatter.string(for: data.visitors) {
            let visitorsAttributedText = NSMutableAttributedString()
                                            .setTextSize(string: "방문객", fontSize: .title3)
                                            .setTextSize(string: " : \(visitors) 명" , fontSize: .body)
            visitorsLabel.attributedText = visitorsAttributedText
        }
        
        let locationAttributedText = NSMutableAttributedString()
                                        .setTextSize(string: "개최지", fontSize: .title3)
                                        .setTextSize(string: " : \(data.location)" , fontSize: .body)
        locationLabel.attributedText = locationAttributedText
        
        let durationAttributedText = NSMutableAttributedString()
                                        .setTextSize(string: "개최 기간", fontSize: .title3)
                                        .setTextSize(string: " : \(data.duration)" , fontSize: .body)
        durationLabel.attributedText = durationAttributedText
        
        descriptionLabel.text = data.description
    }
    
    private func setUpAccessibilty() {
        posterImageView.isAccessibilityElement = true
        posterImageView.accessibilityLabel = "파리 만국박람회 포스터"
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
        titleLabel.setUpDynamicFont(forTextStyle: .title1)
        visitorsLabel.setUpDynamicFont(forTextStyle: .body)
        locationLabel.setUpDynamicFont(forTextStyle: .body)
        durationLabel.setUpDynamicFont(forTextStyle: .body)
        descriptionLabel.setUpDynamicFont(forTextStyle: .body)
    }
}
