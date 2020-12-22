//
//  ExhibisViewController.swift
//  Expo1900
//
//  Created by 김호준 on 2020/12/22.
//

import UIKit

class ExhibitsViewController: UIViewController {
    
    var exhibits: [Exhibit]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        getExhibitInformations()
    }
    
    
    //MARK: - Private
    private func getExhibitInformations() {
        if let data = NSDataAsset(name: "items")?.data {
            let decoder = JSONDecoder()
            do {
                let taskData = try decoder.decode([Exhibit].self, from: data)
                exhibits = taskData
            } catch let error {
                print(error)
            }
        }
    }
}
