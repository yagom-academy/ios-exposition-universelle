//
//  ParisExpoInformationViewController.swift
//  Expo1900
//
//  Created by 예거 on 2021/12/08.
//

import UIKit

class ParisExpoInformationViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var parisExpoPosterImage: UIImageView!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var koreanFlagImage: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        setImages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func setImages() {
        parisExpoPosterImage.image = UIImage(named: AssetName.parisExpoPoster)
        koreanFlagImage.forEach({ image in
            image.image = UIImage(named: AssetName.koreanFlag)
        })
    }
    
    func setLabels() {
        let result = JSONParser<ParisExpoInformation>.decode(from: JSONFileName.parisExpoInformation)

        titleLabel.text = result?.title
        visitorLabel.text = result?.setVisitors
        locationLabel.text = result?.setLocation
        durationLabel.text = result?.setDuration
        descriptionLabel.text = result?.description
    }
}
