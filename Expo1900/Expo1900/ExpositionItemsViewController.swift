//
//  ExpositionItemsViewController.swift
//  Expo1900
//
//  Created by hy on 2022/10/20.
//

import UIKit

class ExpositionItemsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var expositionItems: [ExpositionUniverselleItem] = []
    private let titleText: String = "한국의 출품작"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        loadExpositionItems()
        self.navigationController?.isNavigationBarHidden = false
        self.title = titleText
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: ExpositionItemDetailViewController = segue.destination as? ExpositionItemDetailViewController,
              let item: ExpositionUniverselleItem = sender as? ExpositionUniverselleItem else {
            return
        }
        
        nextViewController.item = item
    }
    
    private func loadExpositionItems() {
        guard let expositionItemsAsset: NSDataAsset = NSDataAsset(name: DataAsset.expositionItems) else {
            return
        }
        
        let decoder: JSONDecoder = JSONDecoder()
        
        do {
            self.expositionItems = try decoder.decode([ExpositionUniverselleItem].self, from: expositionItemsAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension ExpositionItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: Identifier.expositionTableViewCell, for: indexPath)
        let expositionItem: ExpositionUniverselleItem = self.expositionItems[indexPath.row]
        
        cell.imageView?.image = UIImage(named: expositionItem.imageName)
        cell.textLabel?.text = expositionItem.name
        cell.detailTextLabel?.text = expositionItem.shortDescription
        cell.detailTextLabel?.numberOfLines = 0
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

extension ExpositionItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: Identifier.segueOfShowItemDetail, sender: expositionItems[indexPath.row])
    }
}
