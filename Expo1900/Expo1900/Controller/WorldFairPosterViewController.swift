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
    @IBOutlet weak var leftKoreaFlagImageView: UIImageView!
    @IBOutlet weak var rightKoreaFlagImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "메인"
        decodeWorldFairPoster()
        updateImageViews()
    }
    
    private func decodeWorldFairPoster() {
        guard let worldFairPosterData = Parser<WorldFairPoster>.parse(name: "exposition_universelle_1900") else {
            showAlert(alertTitle: "오류 발생, 다시 한번 실행해주세요", okTitle: "OK")
            return
        }
        return worldFairPosterData
    }
    
    private func updateUI() {
        let worldFairPosterData = try? decodeWorldFairPoster()
        
        titleLabel.text = worldFairPosterData?.title
        visitorLabel.text = String(worldFairPosterData?.visitors ?? ExpoEnum.defaultVisitor)
        locationLabel.text = worldFairPosterData?.location
        durationLabel.text = worldFairPosterData?.duration
        descriptionLabel.text = worldFairPosterData?.description
    }
    
    private func updateImageViews() {
        worldFairPosterImageView.image = UIImage(named: "poster")
        leftKoreaFlagImageView.image = UIImage(named: "flag")
        rightKoreaFlagImageView.image = UIImage(named: "flag")
    }
}
