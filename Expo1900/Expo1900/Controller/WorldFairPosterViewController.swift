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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBOutlet weak var worldFairPosterImageView: UIImageView!
    @IBOutlet weak var leftKoreaFlagImageView: UIImageView!
    @IBOutlet weak var rightKoreaFlagImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "메인"
        decodeWorldFairPoster()
        updateImageViews()
    }
    
    func decodeWorldFairPoster() {
        guard let worldFairPosterData = Parser<WorldFairPoster>.parse(name: "exposition_universelle_1900") else {
            return
        }
        
        titleLabel.text = worldFairPosterData.title
        visitorLabel.text = String(worldFairPosterData.visitors)
        locationLabel.text = worldFairPosterData.location
        durationLabel.text = worldFairPosterData.duration
        descriptionLabel.text = worldFairPosterData.description
    }
    
    func updateImageViews() {
        worldFairPosterImageView.image = UIImage(named: "poster")
        leftKoreaFlagImageView.image = UIImage(named: "flag")
        rightKoreaFlagImageView.image = UIImage(named: "flag")
    }
}
