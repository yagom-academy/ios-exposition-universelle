//
//  ExhibitionItemsViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

class ExhibitionItemsViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func decodeData() -> [ExhibitionItem]? {
        let fileName = "items"
        let decodedData = try? [ExhibitionItem].decode(from: fileName)
        
        return decodedData
    }
}

extension ExhibitionItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = decodeData()?.count else {
            return .zero
        }
        
        return rowCount
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: "cell",
                                     for: indexPath) as? ExhibitionItemsTableViewCell
        else {
            return UITableViewCell()
        }
        
        guard let decodedData = decodeData() else {
            return UITableViewCell()
        }
        
        cell.posterImageView.image = UIImage(named: decodedData[indexPath.row].imageName)
        cell.titleLabel.text = decodedData[indexPath.row].name
        cell.subtitleLabel.text = decodedData[indexPath.row].shortDescription

        return cell
    }
}

