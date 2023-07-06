//
//  AppCoordinator.swift
//  Expo1900
//
//  Created by Hyungmin Lee on 2023/07/06.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let information: ParisExpositionInformation = Decoder.decode(fileName: "exposition_universelle_1900") else { return }
        let mainViewController = MainViewController(information)
        
        mainViewController.delegate = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
}

// MARK: - MainViewControllerDelegate
extension AppCoordinator: MainViewControllerDelegate {
    func didTappedKoreaEntryButton() {
        guard let data: [ExpositionItem] = Decoder.decode(fileName: "items") else { return }
        let koreaEntryViewController = KoreaEntryViewController(koreaEntryItems: data)
        let koreaEntryTitle = "한국의 출품작"
        
        koreaEntryViewController.delegate = self
        navigationController.pushViewController(koreaEntryViewController, animated: true)
    }
}

// MARK: - KoreaEntryViewControllerDelegate
extension AppCoordinator: KoreaEntryViewControllerDelegate {
    func didSelectedKoreaEntryTableView(_ expositionItem: ExpositionItem) {
        let entryDetailViewController = EntryDetailViewController(expositionItem)
        
        navigationController.pushViewController(entryDetailViewController, animated: true)
    }
}
