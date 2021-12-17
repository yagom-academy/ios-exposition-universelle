//
//  ViewControllerFactory.swift
//  Expo1900
//
//  Created by Hyoju Son on 2021/12/13.
//

import UIKit

struct StoryboardInformation {
    let bundle: Bundle?
    let storyboardName: String
    let storyboardId: String
}

enum TypeOfViewController {
    case expositionItemTable
    case expositionItem(data: ExpositionItem)
}

extension TypeOfViewController {
    func fetchStoryboardInformation() -> StoryboardInformation {
        switch self {
        case .expositionItemTable:
            return StoryboardInformation(bundle: nil, storyboardName: "ExpositionItemTable", storyboardId: "ExpositionItemTable")
        case .expositionItem:
            return StoryboardInformation(bundle: nil, storyboardName: "ExpositionItem", storyboardId: "ExpositionItem")
        }
    }
}

struct ViewControllerFactory {
    static func createViewController(of typeOfViewController: TypeOfViewController) -> UIViewController {
        let storyboardInformation = typeOfViewController.fetchStoryboardInformation()
        
        let storyboard = UIStoryboard(name: storyboardInformation.storyboardName, bundle: storyboardInformation.bundle)
        
        switch typeOfViewController {
        case .expositionItemTable:
            let viewController = storyboard.instantiateViewController(withIdentifier: storyboardInformation.storyboardId)
            
            return viewController
        case .expositionItem(let data):
            let expositionItemViewController = storyboard.instantiateViewController(identifier: storyboardInformation.storyboardId) { coder in
                return ExpositionItemViewController(coder: coder, expositionItem: data)
            }
            
            return expositionItemViewController
        }
    }
}
