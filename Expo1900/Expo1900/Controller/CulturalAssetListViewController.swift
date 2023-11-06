//
//  CulturalAssetListViewController.swift
//  Expo1900
//
//  Created by Charles on 2023/11/02.
//

import UIKit

final class CulturalAssetListViewController: UITableViewController {
    private var culturalAssets: [CulturalAsset] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.title = "메인"
        navigationController?.isNavigationBarHidden = false
        
        decodeDataAsset()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return culturalAssets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(named: culturalAssets[indexPath.row].imageName)
        content.imageProperties.maximumSize = CGSize(width: 60, height: 60)
        content.imageProperties.reservedLayoutSize = CGSize(width: 65, height: 0)
        
        content.text = culturalAssets[indexPath.row].name
        content.secondaryText = culturalAssets[indexPath.row].shortDescription
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = storyboard?.instantiateViewController(identifier: String(describing: DetailViewController.self)) as? DetailViewController else {
            return
        }
        
        navigationController?.pushViewController(detailViewController, animated: true)
    
        detailViewController.setUp(culturalAsset: culturalAssets[indexPath.row])
    }

    func decodeDataAsset() {
        guard let dataAsset = NSDataAsset(name: "items") else {
            return
        }

        let decoder = JSONDecoder()

        do {
            culturalAssets = try decoder.decode([CulturalAsset].self, from: dataAsset.data)
        } catch {
            let alert = UIAlertController(title: error.localizedDescription, message: "이전 화면으로 돌아갑니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "예", style: .default) { action in
                self.navigationController?.popViewController(animated: true)
            }
            
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
}
