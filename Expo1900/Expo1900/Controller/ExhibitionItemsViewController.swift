//
//  ExhibitionItemsViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

class ExhibitionItemsViewController: UIViewController {
    var exhibitionItems: [ExhibitionItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.exhibitionItems = decode()
    }
    
    private func decode() -> [ExhibitionItem] {
        do {
            let fileName = "items"
            let decodedData = try [ExhibitionItem].decode(from: fileName)
            return decodedData
        } catch {
            return [ExhibitionItem]()
        }
    }
}

extension ExhibitionItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitionItems.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: "cell",
                                     for: indexPath) as? ExhibitionItemsTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.itemImageView.image = UIImage(named: exhibitionItems[indexPath.row].imageName)
        cell.titleLabel.text = exhibitionItems[indexPath.row].name
        cell.subtitleLabel.text = exhibitionItems[indexPath.row].shortDescription

        return cell
    }
}

extension ExhibitionItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewController = storyboard?
            .instantiateViewController(identifier: DetailViewController.identifier)
            as? DetailViewController
        {
            detailViewController.exhibitionItem = exhibitionItems[indexPath.row]
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

