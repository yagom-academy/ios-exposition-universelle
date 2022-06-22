//
//  Expo1900 - MainViewController.swift
//  Created by unchain, bard
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

import UIKit

final class MainViewController: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
    let stackView = UIStackView()
    let expoTitle = UILabel()
    let posterImage = UIImageView()
    let visitorsLabel = UILabel()
    let locationLabel = UILabel()
    let durationLabel = UILabel()
    let descriptionLabel = UILabel()
    let buttonStackView = UIStackView()
    let leftFlagImage = UIImageView()
    let rightFlagImage = UIImageView()
    let goToKoreaEntryButton = UIButton()
    var expoInformation: ExpoInformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setting()
        self.navigationItem.backButtonTitle = ExpoNameSpace.firstViewcontrollerTitle.name
        fetchExpoInformaion()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func didTappedButton(_ sender: UIButton) {
        let entryListViewController = EntryListViewController()
        self.navigationController?.pushViewController(entryListViewController, animated: true)
    }
    
    //MARK: - fetchExpoInformaion
    func fetchExpoInformaion() {
        guard let expoInformation = JSONParser.fetch(fileName: ExpoNameSpace.expoInformationJSONFileName.name, parsedItems: expoInformation) else { return }
        self.expoInformation = expoInformation
    }
}
