//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class PosterViewController: UIViewController {

    private let exposition: Exposition? = {
        let decoder = Decoder()
        return decoder.decodeExposition()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

