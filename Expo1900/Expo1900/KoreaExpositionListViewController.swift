//
//  KoreaExpositionListViewController.swift
//  Expo1900
//
//  Created by Yeon on 2020/12/22.
//

import Foundation
import UIKit

class KoreaExpositionListViewController: UIViewController {
    @IBOutlet weak var koreaExpositionListTableView: UITableView!
    private var koreaExpositionItems: [KoreaExpositionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "한국의 출품작"
        decodeData()
        koreaExpositionListTableView.dataSource = self
        koreaExpositionListTableView.delegate = self
    }
    
    private func decodeData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            showAlert(message: ExpositionError.noDataAsset.localizedDescription)
            return
        }
        do {
            self.koreaExpositionItems = try jsonDecoder.decode([KoreaExpositionItem].self, from: dataAsset.data)
        } catch ExpositionError.canNotDecodeData {
            showAlert(message: ExpositionError.canNotDecodeData.localizedDescription)
        } catch {
            showAlert(message: ExpositionError.unknownError.localizedDescription)
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
        
        cell.setDynamicType()

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let koreaExpoItemViewController: KoreaExpositionItemViewController = segue.destination as? KoreaExpositionItemViewController else {
            showAlert(message: ExpositionError.canNotLoadView.localizedDescription)
            return
        }
        guard let cell = sender as? ExpositionTableViewCell, let index = cell.index else {
            showAlert(message: ExpositionError.canNotLoadTableViewCell.localizedDescription)
            return
        }
        koreaExpoItemViewController.navigationBarTitle = cell.titleLabel.text
        koreaExpoItemViewController.itemImage = cell.koreaItemImageView.image
        koreaExpoItemViewController.itemDescription = koreaExpositionItems[index].description
    }
}

extension KoreaExpositionListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.koreaExpositionListTableView.deselectRow(at: indexPath, animated: true)
    }
}
