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
    @IBOutlet var koreaFlagImages: [UIImageView]!
    private var internationalExposition: InternationalExposition?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated )
        self.navigationItem.title = "메인"
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        decodingInternationalExpositionData()
        matchingInitialValue()
    }
    
    private func decodingInternationalExpositionData() {
        let decoder: JSONDecoder = JSONDecoder()
        if let dataAsset: NSDataAsset = NSDataAsset.init(name: "exposition_universelle_1900") {
            do {
                internationalExposition = try decoder.decode(InternationalExposition.self, from: dataAsset.data)
            } catch DecodingError.dataCorrupted {
                print("DecodingError.dataCorrupted")
            } catch {
                print("unknown error")
            }
        }
    }
    
    private func matchingInitialValue() {
        if let unwrappedInternationalExposition = internationalExposition {
            titleLabel.text = unwrappedInternationalExposition.title
            itemImage.image = UIImage(named: "poster")
            visitorsLabel.text = "방문객: " + String(unwrappedInternationalExposition.visitors) + " 명"
            locationLabel.text = "개최지: " + unwrappedInternationalExposition.location
            durationLabel.text = "개최 기간: " + unwrappedInternationalExposition.duration
            descriptionLabel.text = unwrappedInternationalExposition.description
            for imageView in koreaFlagImages {
                imageView.image = UIImage(named: "flag")
            }
        }
    }
    
}
