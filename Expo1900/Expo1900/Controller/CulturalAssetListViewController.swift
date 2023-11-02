//
//  CulturalAssetListViewController.swift
//  Expo1900
//
//  Created by Charles on 2023/11/02.
//

import UIKit

class CulturalAssetListViewController: UITableViewController {
    var culturalAssets:[CulturalAsset] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeDataAsset()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func decodeDataAsset() {
        let decoder = JSONDecoder()

        guard let dataAsset = NSDataAsset(name: "items") else {
            return
        }

        do {
            culturalAssets = try decoder.decode([CulturalAsset].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }


}
