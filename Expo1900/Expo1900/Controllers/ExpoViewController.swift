//
//  Expo1900 - ExpoViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoViewController: UIViewController {

    enum Constant {
        static let nextButtonTitle = "한국의 출품작 보러가기"
    }
    
    private let koreaItemsVCIdentifier = "koreaItemsVC"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var mainImage: UIImageView!
    @IBOutlet private weak var visitorLabel: UILabel!
    @IBOutlet private weak var placeLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private var buttonImage: [UIImageView]!
    @IBOutlet private weak var nextButton: UIButton!
    
    private var expoData: ExpositionIntroduction?
    private let dataManager: DecodeManger = DecodeManger<ExpositionIntroduction>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setupElementWithData()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction private func nextButtonTapped(_ sender: UIButton) {
        guard let koreaItemsViewController = storyboard?.instantiateViewController(withIdentifier: koreaItemsVCIdentifier) as? KoreaItemsViewController else { return }
        
        navigationController?.pushViewController(koreaItemsViewController, animated: true)
    }
    
    private func setData() {
        do {
            expoData = try dataManager.fetchData(name: AssetName.expoIntroJSON)
        } catch {
            if let error = error as? DataError {
                popErrorAlert(error: error)
                #if DEBUG
                NSLog(error.localizedDescription)
                #endif
            } else {
                popErrorAlert(error: DataError.unknownError)
                #if DEBUG
                NSLog(error.localizedDescription)
                #endif
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
        descriptionTextView.isEditable = false
        buttonImage.forEach { button in
            button.image = UIImage(named: AssetName.flagButtonImage)
        }
        nextButton.setTitle(Constant.nextButtonTitle, for: .normal)
    }
    
    private func popErrorAlert(error: DataError) {
        let alert = UIAlertController(title: error.localizedDescription, message: error.failureReason, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(confirm)
        present(alert, animated: true, completion: nil)
    }
}
