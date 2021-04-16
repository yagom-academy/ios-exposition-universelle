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
        let temporaryCell = tableView.dequeueReusableCell(withIdentifier: "heritageCell", for: indexPath)
        guard let tableViewCell = temporaryCell as? HeritageCell else { return temporaryCell }
        guard let expoData = expoData else { return temporaryCell }
        
        tableViewCell.myImageView.image = UIImage(named: expoData[indexPath[1]].imageName)
        tableViewCell.myTitleLabel.text = expoData[indexPath[1]].name
        tableViewCell.myShortDescription.text = expoData[indexPath[1]].shortDescription
        
        return tableViewCell
    }
}
