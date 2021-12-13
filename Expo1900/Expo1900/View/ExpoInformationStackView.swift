import UIKit

class ExpoInformationStackView: UIStackView {
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
        setUpStyle()
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
    
    private func setUpStyle() {
        spacing = 10
        
        titleLabel.textAlignment = .center
        visitorsLabel.textAlignment = .center
        locationLabel.textAlignment = .center
        durationLabel.textAlignment = .center
        
        titleLabel.numberOfLines = 2
        descriptionLabel.numberOfLines = 0
        
        titleLabel.font = .preferredFont(forTextStyle: .title1)
    }
}
