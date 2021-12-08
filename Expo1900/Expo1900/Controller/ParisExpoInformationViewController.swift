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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        setImage()
        // Do any additional setup after loading the view.
    }
    
    func setImage() {
        parisExpoPosterImage.image = UIImage(named: "poster")
    }
    
    func setLabel() {
        let jsonName = "exposition_universelle_1900"
        let result = JSONParser<ParisExpoInformation>.decode(from: jsonName)

        titleLabel.text = result?.title
        visitorLabel.text = result?.visitors.description
        locationLabel.text = result?.location
        durationLabel.text = result?.duration
        descriptionLabel.text = result?.description
    }
}
