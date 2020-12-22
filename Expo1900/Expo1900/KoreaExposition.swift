//
//  KoreaExposition.swift
//  Expo1900
//
//  Created by zdo on 2020/12/22.
//

import UIKit

class KoreaExposition: UITableViewController {
    var koreaItemList: [KoreaItem]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "한국의 출품작"
        
        let jsonAnalyzer = JSONAnalyzer()
        guard let data = jsonAnalyzer.readFile(forName: "items", [KoreaItem].self) else {
            return
        }
        koreaItemList = data
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        koreaItemList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpositionCell") as? ExpositionCell else {
            return UITableViewCell()
        }
        
        cell.assetImage.image = UIImage(named: koreaItemList[indexPath.row].imageName)
        cell.titleLabel.text = koreaItemList[indexPath.row].name
        cell.summaryLabel.text = koreaItemList[indexPath.row].shortDescription
        
        return cell
    }
}
