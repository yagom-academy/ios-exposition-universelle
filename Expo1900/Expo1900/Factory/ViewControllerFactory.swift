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
}

extension TypeOfViewController {
    func fetchStoryboardInformation() -> StoryboardInformation {
         switch self {
         case .expositionItemTable:
             return StoryboardInformation(bundle: nil, storyboardName: "ExpositionItemTable", storyboardId: "ExpositionItemTable")
         }
     }
}

class ViewControllerFactory: NSObject {
    static func createViewController(of typeOfViewController: TypeOfViewController) -> UIViewController {
        let storyboardInformation = typeOfViewController.fetchStoryboardInformation()
        
        let storyboard = UIStoryboard(name: storyboardInformation.storyboardName, bundle: storyboardInformation.bundle)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardInformation.storyboardId)
        
        return viewController
    }
}
