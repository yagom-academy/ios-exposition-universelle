//
//  WorldFairPosterViewController.swift
//  Expo1900
//
//  Created by Eddy on 2022/04/14.
//

import UIKit

final class WorldFairPosterViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var worldFairPosterImageView: UIImageView!
    @IBOutlet weak var koreaFlagImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func decodeWorldFairPoster() {
        let worldFairPosterData = Parser<WorldFairPoster>.parse(name: "exposition_universelle_1900")
        
        titleLabel.text = worldFairPosterData?.title
        visitorLabel.text = String(worldFairPosterData?.visitors ?? 0)
        locationLabel.text = worldFairPosterData?.location
        durationLabel.text = worldFairPosterData?.duration
        descriptionLabel.text = worldFairPosterData?.description
    }
    
    func updateImageViews() {
        worldFairPosterImageView.image = UIImage(named: "poster")
        koreaFlagImageView.image = UIImage(named: "flag")
    }
}
