
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var visitorCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var modelForMainView = ModelForMainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let data = NSDataAsset(name: "exposition_universelle_1900") else {
            fatalError()
        }
        
        let decoder = JSONDecoder()
        guard let expositionData = try? decoder.decode(Exposition.self, from: data.data) else { return }
        
        modelForMainView.setUpData(with: expositionData)
        updateUI(with: modelForMainView)
    }
    
    //가공된 데이터를 뷰에 보여줌
    func updateUI(with data: ModelForMainView) {

        titleLabel.text = data.title
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        imageView.image = data.image
        
        visitorCountLabel.text = data.visitors
        locationLabel.text = data.location
        durationLabel.text = data.duration
        descriptionLabel.text = data.description
    }


}

