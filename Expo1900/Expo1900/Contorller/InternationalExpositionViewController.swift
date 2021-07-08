//
//  InternationalExpositionViewController.swift
//  Expo1900
//
//  Created by 김준건 on 2021/07/08.
//

import UIKit

class InternationalExpositionViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var koreaFlagImage: UIImageView!
    var internationalExposition: InternationalExposition?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        decodingInternationalExpositionData()
        matchingInitialValue()
        // Do any additional setup after loading the view.
    }
    
    func decodingInternationalExpositionData() {
        let decoder: JSONDecoder = JSONDecoder()
        if let dataAsset: NSDataAsset = NSDataAsset.init(name: "exposition_universelle_1900") {
            do {
                internationalExposition = try decoder.decode(InternationalExposition.self, from: dataAsset.data)
            } catch {
                print("Decoding Error")
            }
        }
    }
    
    func matchingInitialValue() {
        titleLabel.text = internationalExposition?.title
        itemImage.image = UIImage(named: "poster")
        visitorsLabel.text = "\(internationalExposition?.visitors ?? 0)"
        locationLabel.text = internationalExposition?.location
        durationLabel.text = internationalExposition?.duration
        descriptionLabel.text = internationalExposition?.description
        koreaFlagImage.image = UIImage(named: "flag")
    }

}
