//
//  Expo1900 - ViewController.swift
//  Created by 세홍, 송준, 무리
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    var exposition: Exposition = Exposition(title: "", visitors: 0, location: "", duration: "", description: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

private extension ViewController {
    func decodeData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            self.exposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
