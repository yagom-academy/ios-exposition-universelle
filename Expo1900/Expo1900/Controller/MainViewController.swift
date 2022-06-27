//
//  Expo1900 - MainViewController.swift
//  Created by unchain, bard
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
    let stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    let expoTitle: UILabel = {
        let expoTitle = UILabel()
        
        expoTitle.numberOfLines = 0
        expoTitle.textAlignment = .center
        
        return expoTitle
    }()
    
    let posterImage: UIImageView = {
        let posterImage = UIImageView()
        
        posterImage.image = UIImage(named: ExpoNameSpace.expoPoster.name)
        
        return posterImage
    }()
    
    let visitorsLabel = UILabel()
    let locationLabel = UILabel()
    let durationLabel = UILabel()
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        
        return descriptionLabel
    }()
    
    let buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        
        buttonStackView.spacing = 10
        buttonStackView.axis = .horizontal
        
        return buttonStackView
    }()
    
    let leftFlagImage: UIImageView = {
        let leftFlagImage = UIImageView()
        
        leftFlagImage.image = UIImage(named: ExpoNameSpace.flagImage.name)
        
        return leftFlagImage
    }()
    
    let rightFlagImage: UIImageView = {
        let rightFlagImage = UIImageView()
        
        rightFlagImage.image = UIImage(named: ExpoNameSpace.flagImage.name)
        
        return rightFlagImage
    }()
    
    let goToKoreaEntryButton: UIButton = {
        let goToKoreaEntryButton = UIButton()
        
        goToKoreaEntryButton.setTitle(ExpoNameSpace.koreaEntry.name, for: .normal)
        goToKoreaEntryButton.setTitleColor(.systemBlue, for: .normal)
        
        return goToKoreaEntryButton
    }()
    
    var expoInformation: ExpoInformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ExpoNameSpace.firstViewcontrollerTitle.name
        self.fetchExpoInformaion()
        self.setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func didTappedButton(_ sender: UIButton) {
        let entryListViewController = EntryListViewController()
        self.navigationController?.pushViewController(entryListViewController,
                                                      animated: true)
    }
    
    //MARK: - fetchExpoInformaion
    func fetchExpoInformaion() {
        guard let expoInformation = JSONParser.fetch(fileName: ExpoNameSpace.expoInformationJSONFileName.name,
                                                     parsedItems: expoInformation) else { return }
        self.expoInformation = expoInformation
    }
}
