//  Expo1900 - EntriesDedatilViewController.swift
//  Created by Mangdi, zhilly on 2022/10/20

import UIKit

class EntriesDedatilViewController: UIViewController {
    var koreanEntry: KoreanEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = koreanEntry?.name
    }
}
