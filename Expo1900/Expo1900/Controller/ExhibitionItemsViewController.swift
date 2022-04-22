//
//  ExhibitionItemsViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

final class ExhibitionItemsViewController: UIViewController {
    private var exhibitionItems: [ExhibitionItem] = []
    
    @IBOutlet weak private var itemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemsTableView.dataSource = self
        self.itemsTableView.delegate = self
        self.exhibitionItems = decodeJson()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIViewController.attemptRotationToDeviceOrientation()
    }
    
    private func decodeJson() -> [ExhibitionItem] {
        do {
            let fileName = ExpoData.exhibitionItemFileName
            let decodedData = try [ExhibitionItem].decode(from: fileName)
            return decodedData
        } catch {}
        
        return exhibitionItems
    }
}

extension ExhibitionItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exhibitionItems.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cellIdentifier = "cell"
        
        guard let exhibitionItemCell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? ExhibitionItemsTableViewCell
        else {
            return UITableViewCell()
        }
        
        let itemAtRow = self.exhibitionItems[indexPath.row]
        exhibitionItemCell.setUpCell(by: itemAtRow)

        return exhibitionItemCell
    }
}

extension ExhibitionItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exhibitionItem = self.exhibitionItems[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(
            identifier: DetailViewController.identifier) { coder in
            DetailViewController(exhibitionItem: exhibitionItem, coder: coder)}
                
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
