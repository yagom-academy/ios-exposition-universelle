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
        self.navigationItem.title = ExpoStringEnum.mainTitle
        updateUI()
        worldFairPosterImageView.isAccessibilityElement = true
        worldFairPosterImageView.accessibilityLabel = "파리 박람회 포스터"
        updateImageViews()
    }
    
    private func decodeWorldFairPoster() throws -> WorldFairPoster {
        let assetSeeker = AssetSeeker()
        var worldFairPosterData: WorldFairPoster?
        
        do {
            worldFairPosterData = try assetSeeker.matchWorldFairPosterAsset()
        } catch ExpoError.decodeError {
            showAlert(alertTitle: ExpoStringEnum.failedHandleData, okTitle: ExpoStringEnum.okTitle)
        }
        
        guard let worldData = worldFairPosterData else {
            throw ExpoError.emptyValueError
        }
     
        return worldData
    }
        
    private func updateUI() {
        var worldFairPosterData: WorldFairPoster?
        let replacedTitleText = ReplaceTitles()
        let expoInformation = ExpoInformation()
        
        do {
            worldFairPosterData = try decodeWorldFairPoster()
        } catch ExpoError.decodeError {
            showAlert(alertTitle: ExpoStringEnum.failedHandleData, okTitle: ExpoStringEnum.okTitle)
        } catch {
            showAlert(alertTitle: ExpoStringEnum.unexpectedError, okTitle: ExpoStringEnum.okTitle)
        }
        do {
            titleLabel.text = try replacedTitleText.replaceTitle()
            visitorLabel.text = try expoInformation.showVisitorLabel()
            locationLabel.text = try expoInformation.showLocationLabel()
            durationLabel.text = try expoInformation.showDurationLabel()
            descriptionLabel.text = try expoInformation.showDescriptionLabel()
        } catch {
            showAlert(alertTitle: ExpoStringEnum.failedTransferData, okTitle: ExpoStringEnum.okTitle)
        }
    }
    
    private func updateImageViews() {
        worldFairPosterImageView.image = UIImage(named: ExpoStringEnum.worldFairPosterImageFileName)
        leftKoreaFlagImageView.image = UIImage(named: ExpoStringEnum.koreaFlagImageFileName)
        rightKoreaFlagImageView.image = UIImage(named: ExpoStringEnum.koreaFlagImageFileName)
    }
}
