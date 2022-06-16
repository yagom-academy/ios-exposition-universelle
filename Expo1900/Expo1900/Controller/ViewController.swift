//
//  Expo1900 - ViewController.swift
//  Created by Kiwi, Finnn. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private let mainScrollView = MainUIScrollView()
    
    override func loadView() {
        view = mainScrollView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func decodeJson<T: Codable>(jsonName: String) -> T? {
        let decoder = JSONDecoder()
        
        guard let fileLocation = Bundle.main.url(forResource: jsonName, withExtension: "json"),
              let data = try? Data(contentsOf: fileLocation),
              let expoInfo =  try? decoder.decode(T.self, from: data) else { return nil }
        return expoInfo
    }
}
