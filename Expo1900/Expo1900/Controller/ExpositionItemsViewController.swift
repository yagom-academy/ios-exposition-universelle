//  Expo1900 - ExpositionItemsViewController.swift
//  Created by Ayaan, Bella on 2022/10/20.
//  Copyright © yagom academy. All rights reserved.

import UIKit

class ExpositionItemsViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Property
    private var expositionItems: [ExpositionUniverselleItem] = []
    private let titleText: String = "한국의 출품작"
    
    //MARK: - Override Method
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
}

extension ExpositionItemsViewController {
    //MARK: - Private Method
    private func loadExpositionItems() {
        do {
            self.expositionItems = try JSONProcessor.process([ExpositionUniverselleItem].self, dataName: DataAsset.expositionItems)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension ExpositionItemsViewController: UITableViewDataSource {
    //MARK: - UITableViewDataSource Protocol Method
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
    //MARK: - UITableViewDelegate Protocol Method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: Identifier.segueOfShowItemDetail, sender: expositionItems[indexPath.row])
    }
}
