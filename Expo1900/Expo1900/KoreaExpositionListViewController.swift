//
//  KoreaExpositionListViewController.swift
//  Expo1900
//
//  Created by Yeon on 2020/12/22.
//

import Foundation
import UIKit

class KoreaExpositionListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var koreaExpositionItems: [KoreaExpositionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "한국의 출품작"
        decodeData()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func decodeData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        do {
            self.koreaExpositionItems = try jsonDecoder.decode([KoreaExpositionItem].self, from: dataAsset.data)
        } catch {
            print(error)
        }
    }
}

extension KoreaExpositionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.koreaExpositionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! ExpositionTableViewCell
        
        cell.titleLabel.text = koreaExpositionItems[indexPath.row].name
        cell.subtitleLabel.text = koreaExpositionItems[indexPath.row].shortDescription
        cell.koreaItemImageView.image = koreaExpositionItems[indexPath.row].image
        cell.index = indexPath.row
        
        if cell.subtitleLabel.adjustsFontSizeToFitWidth == false {
            cell.subtitleLabel.adjustsFontSizeToFitWidth = true
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: KoreaExpositionItemDetail = segue.destination as? KoreaExpositionItemDetail else {
            return
        }
        guard let cell = sender as? ExpositionTableViewCell, let index = cell.index else {
            return
        }
        nextViewController.navigationBarTitle = cell.titleLabel.text
        nextViewController.itemImage = cell.koreaItemImageView.image
        nextViewController.itemDescription = koreaExpositionItems[index].description
    }
}

extension KoreaExpositionListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
