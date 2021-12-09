import UIKit

class InformationStackView: UIStackView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp(data: ExpoInformation) {
        titleLabel.text = data.title
        titleLabel.numberOfLines = 2
        titleLabel.font = .preferredFont(forTextStyle: .title1)
        posterImageView.image = UIImage(named: "poster")
        visitorsLabel.text = "\(data.visitors)"
        locationLabel.text = data.location
        durationLabel.text = data.duration
        descriptionLabel.text = data.description
        descriptionLabel.numberOfLines = 0
    }
}
