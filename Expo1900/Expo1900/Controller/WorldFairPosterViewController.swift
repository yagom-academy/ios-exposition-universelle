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
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        navigationController?.setNavigationBarHidden(true, animated: animated)
        appDelegate?.shouldSupportAllOrientation = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        navigationController?.setNavigationBarHidden(false, animated: animated)
        appDelegate?.shouldSupportAllOrientation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ExpoStringEnum.mainTitle
        updateUI()
        worldFairPosterImageView.isAccessibilityElement = true
        worldFairPosterImageView.accessibilityLabel = "파리 박람회 포스터"
        updateImageViews()
    }
    
    private func replaceTitle() -> String {
        var replacedTitleText: String = ""
        let data = try? decodeWorldFairPoster()
        
        guard let separatedData = data?.title.components(separatedBy: ExpoMagicNumberEnum.separatePoint) else {
            return ExpoMagicNumberEnum.notFoundDate
        }
        replacedTitleText += separatedData[0]
        replacedTitleText += ExpoMagicNumberEnum.newLine + ExpoMagicNumberEnum.separatePoint + separatedData[1]
        
        return replacedTitleText
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
        let replacedTitleText = replaceTitle()
        
        do {
            worldFairPosterData = try decodeWorldFairPoster()
        } catch ExpoError.decodeError {
            showAlert(alertTitle: ExpoStringEnum.failedHandleData, okTitle: ExpoStringEnum.okTitle)
        } catch {
            showAlert(alertTitle: ExpoStringEnum.unexpectedError, okTitle: ExpoStringEnum.okTitle)
        }
        titleLabel.text = replacedTitleText
        visitorLabel.text = "방문객 : " + String(worldFairPosterData?.visitors ?? ExpoMagicNumberEnum.defaultVisitor)
        locationLabel.text = "개최지 : " + (worldFairPosterData?.location ?? ExpoMagicNumberEnum.notFoundLocation)
        durationLabel.text = "개최 기간 : " + (worldFairPosterData?.duration ?? ExpoMagicNumberEnum.notFoundDuration)
        descriptionLabel.text = worldFairPosterData?.description
    }
    
    private func updateImageViews() {
        worldFairPosterImageView.image = UIImage(named: ExpoStringEnum.worldFairPosterImageFileName)
        leftKoreaFlagImageView.image = UIImage(named: ExpoStringEnum.koreaFlagImageFileName)
        rightKoreaFlagImageView.image = UIImage(named: ExpoStringEnum.koreaFlagImageFileName)
    }
}
