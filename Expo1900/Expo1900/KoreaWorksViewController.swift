//
//  KoreaWorksViewController.swift
//  Expo1900
//
//  Created by sole on 2020/12/23.
//

import UIKit

class KoreaWorksViewController: UIViewController {
    
    private var koreaWorkList: [KoreaWorks] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension KoreaWorksViewController {
    
    private func decodeKoreaWorks() {
        
        let jasonDecoder = JSONDecoder()
        guard let assetData: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        guard let koreaWorksData = try? jasonDecoder.decode([KoreaWorks].self, from: assetData.data) else {
            return
        }
        koreaWorkList = koreaWorksData
    }
}
