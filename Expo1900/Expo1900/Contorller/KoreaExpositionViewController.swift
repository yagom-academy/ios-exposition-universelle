//
//  KoreaExpositionViewController.swift
//  Expo1900
//
//  Created by 김준건 on 2021/07/07.
//

import UIKit

class KoreaExpositionViewController: UIViewController {
    @IBOutlet weak var koreaExpositionTableView: UITableView!
    var koreaExpositions: [KoreaExposition] = []
    let tableViewCellIdentifer: String = "KoreaExpositionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodingKoreaExpositionData()
        koreaExpositionTableView.dataSource = self
        koreaExpositionTableView.delegate = self
    }
    
    func decodingKoreaExpositionData() {
        let decoder: JSONDecoder = JSONDecoder()
        if let dataAsset: NSDataAsset = NSDataAsset.init(name: "items") {
            do {
                koreaExpositions = try decoder.decode([KoreaExposition].self, from: dataAsset.data)
            } catch {
                print("Decoding Error")
            }
        }
    }
}

extension KoreaExpositionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaExpositions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifer, for: indexPath)
        guard let customCell = cell as? KoreaExpositionCustomCell else {
            return cell
        }
        let koreaExpositionItem: KoreaExposition = koreaExpositions[indexPath.row]
        customCell.titleLabel.text = koreaExpositionItem.name
        customCell.shortDescriptionLabel.text = koreaExpositionItem.shortDescription
        customCell.itemImage.image = UIImage(named: koreaExpositionItem.imageName)
        return customCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MoveToDetail", sender: indexPath)
    }
}
