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
        if let unwrappedInternationalExposition = internationalExposition {
            titleLabel.text = unwrappedInternationalExposition.title
            itemImage.image = UIImage(named: "poster")
            visitorsLabel.text = String(unwrappedInternationalExposition.visitors)
            locationLabel.text = unwrappedInternationalExposition.location
            durationLabel.text = unwrappedInternationalExposition.duration
            descriptionLabel.text = unwrappedInternationalExposition.description
            koreaFlagImage.image = UIImage(named: "flag")
        }
    }
    
}
