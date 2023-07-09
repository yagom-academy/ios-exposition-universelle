//
//  AppCoordinator.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/07/06.
//

import UIKit

final class AppCoordinator {
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(_ completionHandler: () -> Void = {}) {
        guard let information: ParisExpositionInformation = Decoder.decode(fileName: "exposition_universelle_1900") else {
            pushDecodingFailureViewController()
            return
        }
        
        let mainViewController = MainViewController(information)
        
        mainViewController.delegate = self
        mainViewController.navigationItem.title = "메인"
        navigationController.pushViewController(mainViewController, animated: true)
        
        completionHandler()
    }
    
    private func pushDecodingFailureViewController() {
        let decodingFailureViewController = DecodingViewController()
        
        navigationController.pushViewController(decodingFailureViewController, animated: true)
    }
}

// MARK: - MainViewControllerDelegate
extension AppCoordinator: MainViewControllerDelegate {
    func didTappedKoreaEntryButton() {
        guard let data: [ExpositionItem] = Decoder.decode(fileName: "items") else {
            pushDecodingFailureViewController()
            return
        }
        
        let koreaEntryViewController = KoreaEntryViewController(koreaEntryItems: data)
        
        koreaEntryViewController.delegate = self
        koreaEntryViewController.navigationItem.title = "한국의 출품작"
        navigationController.pushViewController(koreaEntryViewController, animated: true)
    }
}

// MARK: - KoreaEntryViewControllerDelegate
extension AppCoordinator: KoreaEntryViewControllerDelegate {
    func didSelectedKoreaEntryTableView(_ expositionItem: ExpositionItem) {
        let entryDetailViewController = EntryDetailViewController(expositionItem)
        
        entryDetailViewController.navigationItem.title = expositionItem.name
        navigationController.pushViewController(entryDetailViewController, animated: true)
    }
}
