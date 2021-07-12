//
//  KoreaExpositionViewController.swift
//  Expo1900
//
//  Created by 김준건 on 2021/07/07.
//

import UIKit

class KoreaExpositionViewController: UIViewController {
    @IBOutlet weak var koreaExpositionTableView: UITableView!
    @IBOutlet weak var koreaExpositionViewTitle: UINavigationItem!
    var koreaExpositions: [KoreaExposition] = []
    let tableViewCellIdentifer: String = "KoreaExpositionCell"
    let viewTitle: String = "한국의 출품작"


    override func viewDidLoad() {
        super.viewDidLoad()
        koreaExpositionViewTitle.title = viewTitle
        decodingKoreaExpositionData()
        koreaExpositionTableView.dataSource = self
        koreaExpositionTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoveToDetail" {
            if let detailViewController = segue.destination as? KoreaExpositionDetailViewController,
               let index = sender as? Int {
                let detailData: KoreaExposition = koreaExpositions[index]
                detailViewController.koreaExpositionItem = detailData
            }
        }
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
        performSegue(withIdentifier: "MoveToDetail", sender: indexPath.row)
    }
}

