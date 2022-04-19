//
//  WorldFairPosterViewController.swift
//  Expo1900
//
//  Created by Eddy on 2022/04/14.
//

import UIKit

final class WorldFairPosterViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var worldFairPosterImageView: UIImageView!
    @IBOutlet private weak var leftKoreaFlagImageView: UIImageView!
    @IBOutlet private weak var rightKoreaFlagImageView: UIImageView!
    
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
        updateUI()
        updateImageViews()
    }
    
    private func decodeWorldFairPoster() throws -> WorldFairPoster {
        let assetSeeker = AssetSeeker()
        var worldFairPosterData: WorldFairPoster?
        
        do {
            worldFairPosterData = try assetSeeker.matchWorldFairPosterAsset()
        } catch ExpoError.decodeError {
            showAlert(alertTitle: "데이터 처리가 실패했습니다", okTitle: "OK")
        }
        
        guard let worldData = worldFairPosterData else {
            throw ExpoError.emptyValueError
        }
     
        return worldData
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
