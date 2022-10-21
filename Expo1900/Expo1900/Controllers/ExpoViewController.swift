//
//  Expo1900 - ExpoViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var mainImage: UIImageView!
    @IBOutlet private weak var visitorLabel: UILabel!
    @IBOutlet private weak var placeLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private var buttonImage: [UIImageView]!
    @IBOutlet private weak var nextButton: UIButton!
    
    private var expoData: ExpositionIntroduction?
    private let dataManager: DataManager = DataManager<ExpositionIntroduction>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setupElementWithData()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction private func nextButtonTapped(_ sender: UIButton) {
        guard let koreaItemsVC = storyboard?.instantiateViewController(withIdentifier: Identifier.koreaItemsVCIdentifier) as? KoreaItemsViewController else { return }
        
        navigationController?.pushViewController(koreaItemsVC, animated: true)
    }
    
    private func setData() {
        do {
            expoData = try dataManager.fetchData(name: AssetName.expoIntroJSON)
        } catch {
            if let error = error as? DataError {
                print(error.message)
            } else {
                print(DataError.unknownError.message)
            }
        }
    }
    
    private func setupElementWithData() {
        titleLabel.text = expoData?.title
        mainImage.image = UIImage(named: AssetName.expoImage)
        visitorLabel.text = expoData?.visitorNumberDescription
        placeLabel.text = expoData?.locationDescription
        timeLabel.text = expoData?.durationDescription
        descriptionTextView.text = expoData?.description
        buttonImage.forEach { button in
            button.image = UIImage(named: AssetName.flagButtonImage)
        }
        nextButton.setTitle(Constant.nextButtonTitle, for: .normal)
    }
}
