//
//  KoreanHeritageViewController.swift
//  Expo1900
//
//  Created by 김찬우 on 2021/04/15.
//

import UIKit

class KoreanHeritageViewController: UITableViewController {
    
    let expoData = try? JSONConverter<[HeritageItem]>.parse(assetName: "items").get()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expoData?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "heritageCell", for: indexPath)
    }
    
}
