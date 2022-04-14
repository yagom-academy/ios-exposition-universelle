//
//  ExhibitionItemsViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

class ExhibitionItemsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var decodedData: [ExhibitionItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        guard let decodedData = decodeData() else {
            return
        }
        
        self.decodedData = decodedData
    }
    
    private func decodeData() -> [ExhibitionItem]? {
        let fileName = "items"
        let decodedData = try? [ExhibitionItem].decode(from: fileName)

        return decodedData
    }
}

extension ExhibitionItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return decodedData.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: "cell",
                                     for: indexPath) as? ExhibitionItemsTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.posterImageView.image = UIImage(named: decodedData[indexPath.row].imageName)
        cell.titleLabel.text = decodedData[indexPath.row].name
        cell.subtitleLabel.text = decodedData[indexPath.row].shortDescription

        return cell
    }
}

extension ExhibitionItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailVC = storyboard?.instantiateViewController(identifier: DetailViewController.identifier) as? DetailViewController {
            detailVC.itemDetailData = decodedData[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

