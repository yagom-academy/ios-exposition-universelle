//
//  KoreaExposition.swift
//  Expo1900
//
//  Created by zdo on 2020/12/22.
//

import UIKit

class KoreaExpositionTableViewController: UITableViewController {
    var koreaItemList: [KoreaItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "한국의 출품작"
        
        let jsonAnalyzer = JSONAnalyzer()
        if let data = jsonAnalyzer.readFile(forName: "items", [KoreaItem].self) {
            koreaItemList = data
        }
        
        UIOrientation.setUIOrientation(.all)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = koreaItemList?.count else {
            return 0
        }
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpositionCell") as? ExpositionTableViewCell else {
            return UITableViewCell()
        }
        
        if let itemList = koreaItemList {
            cell.setData(itemList[indexPath.row])
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let expositionDescriptionViewController = storyboard?.instantiateViewController(identifier: "ExpositionDescriptionViewController") as? ExpositionDescriptionViewController {
            setExpositionDesciprionViewControllerData(expositionDescriptionViewController, indexPath)
            navigationController?.pushViewController(expositionDescriptionViewController, animated: true)
        }
    }
    
    private func setExpositionDesciprionViewControllerData(_ expositionDescriptionViewController: ExpositionDescriptionViewController, _ indexPath: IndexPath) {
        if let itemList = koreaItemList {
            let image = UIImage(named: itemList[indexPath.row].imageName)
            let description = itemList[indexPath.row].description
            let assetTitle = itemList[indexPath.row].name
            expositionDescriptionViewController.assetImageData = image
            expositionDescriptionViewController.assetDescriptionData = description
            expositionDescriptionViewController.assetTitle = assetTitle
        }
    }
}
