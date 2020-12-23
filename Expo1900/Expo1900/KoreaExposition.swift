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
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        koreaItemList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpositionCell") as? ExpositionTableViewCell else {
            return UITableViewCell()
        }
        
        cell.assetImage.image = UIImage(named: koreaItemList[indexPath.row].imageName)
        cell.titleLabel.text = koreaItemList[indexPath.row].name
        cell.summaryLabel.text = koreaItemList[indexPath.row].shortDescription
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let expositionDescriptionViewController = storyboard?.instantiateViewController(identifier: "ExpositionDescriptionViewController") as? ExpositionDescriptionViewController else {
            return
        }
        
        expositionDescriptionViewController.assetImageData = UIImage(named: koreaItemList[indexPath.row].imageName)
        expositionDescriptionViewController.assetDescriptionData = koreaItemList[indexPath.row].description
        navigationController?.pushViewController(expositionDescriptionViewController, animated: true)
    }
}
