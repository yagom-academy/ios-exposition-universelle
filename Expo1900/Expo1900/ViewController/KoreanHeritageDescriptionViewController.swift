//
//  KoreanHeritageDescriptionViewController.swift
//  Expo1900
//
//  Created by 김찬우 on 2021/04/16.
//

import UIKit

class KoreanHeritageDescriptionViewController: UIViewController {
    
    var heritageItem: HeritageItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = heritageItem.name
        
        if let view = view as? KoreanHeritageDescriptionView {
            view.heritageItem = heritageItem
            view.초기화해주기()
        }
    }
}
