//
//  KoreaItemsController.swift
//  Expo1900
//
//  Created by tottalE, Kyo on 10/17/22.
//

import UIKit

class KoreaItemsViewController: UIViewController {

    let dataManager: DataManager = DataManager()
    var koreaItems: [KoreaItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        print(koreaItems)
    }
    
    func setData() {
        do {
            koreaItems = try dataManager.fetchKoreaItemData()
        } catch {
            if let error = error as? DataError {
                print(error.message)
            } else {
                print(DataError.unknownError.message)
            }
        }
    }
}
