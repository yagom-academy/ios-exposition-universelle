//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private var introduction: Introduction?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeIntroduction()
        configureLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigation()
    }

    @IBAction func touchUpGoToEntryListButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: StoryboardNamespace.Name.main, bundle: Bundle.main)
        let entryListViewController = storyboard.instantiateViewController(withIdentifier: StoryboardNamespace.ID.entryListViewController)

        navigationItem.backBarButtonItem = createMainBackBarButtonItem()
        navigationController?.pushViewController(entryListViewController, animated: true)
    }
    
    private func createMainBackBarButtonItem() -> UIBarButtonItem {
        let backBarButtonTitle = "메인"
        let backBarButtonItem = UIBarButtonItem(title: backBarButtonTitle, style: .plain, target: self, action: nil)
        
        return backBarButtonItem
    }
    
    private func decodeIntroduction() {
        do {
            introduction = try Decoder.decodeJSON(DataAssetNamespace.introduction)
        } catch {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            
            switch error {
            case DecoderError.notFoundAsset:
                alert.message = DecoderError.notFoundAsset.description
            case DecoderError.decodeFailed:
                alert.message = DecoderError.decodeFailed.description
            default:
                alert.message = DecoderError.unexpectedError.description
            }
            
            present(alert, animated: true)
        }
    }
    
    private func configureLabels() {
        guard let title = introduction?.title,
              let visitors = introduction?.visitors,
              let location = introduction?.location,
              let duration = introduction?.duration,
              let description = introduction?.description else {
            return
        }
        
        titleLabel.text = title.replacingOccurrences(of: "(", with: "\n(")
        visitorsLabel.text = ": \(DataFormatter.decimalStyle.string(for: visitors) ?? "") 명"
        locationLabel.text = ": \(location)"
        durationLabel.text = ": \(duration)"
        descriptionLabel.text = description
    }
    
    private func configureNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
}
