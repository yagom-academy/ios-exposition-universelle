//
//  ExhibitionItemsViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

class ExhibitionItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = decodeData()?.count else {
            return .zero
        }
        
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(named: decodeData()![indexPath.row].imageName)
        content.text = decodeData()![indexPath.row].name
        content.secondaryText = decodeData()![indexPath.row].shortDescription
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    private func decodeData() -> [ExhibitionItem]? {
        let fileName = "items"
        let decodedData = try? [ExhibitionItem].decode(from: fileName)
        
        return decodedData
    }
}
