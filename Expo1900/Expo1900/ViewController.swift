//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var expo: Expo?
    var items: Item?

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try parseExpoData()
            guard let expoScript = expo else { return }
            print(expoScript.title)
            print(expoScript.description)
        } catch {
        }
    }
    
    private func parseExpoData() throws {
        guard let asset = NSDataAsset.init(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            expo = try JSONDecoder().decode(Expo.self, from: asset.data)
        } catch {
            throw DataError.InvalidAccess
        }
    }
    
    private func parseItemsData() throws {
        guard let asset = NSDataAsset.init(name: "items") else {
            return
        }
        
        do {
            items = try JSONDecoder().decode(Item.self, from: asset.data)
        } catch {
            throw DataError.InvalidAccess
        }
    }
}

