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
        setLabel()
        setImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func setImage() {
        parisExpoPosterImage.image = UIImage(named: "poster")
        koreanFlagImage.forEach({ image in
            image.image = UIImage(named: "flag")
        })
    }
    
    func setLabel() {
        let result = JSONParser<ParisExpoInformation>.decode(from: JSONFileName.parisExpoInformation)

        titleLabel.text = result?.title
        visitorLabel.text = result?.visitors.description
        locationLabel.text = result?.location
        durationLabel.text = result?.duration
        descriptionLabel.text = result?.description
    }
}
