//
//  KoreaItemsViewController.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/21.
//

import UIKit

class KoreaItemsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    var expositionItems: [ExpositionUniverselleItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
        loadExpositionItemsData()
        
    }
    
    private func setupNavigation() {
        self.navigationController?.isNavigationBarHidden = false
        self.title = "한국의 출품작"
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadExpositionItemsData() {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            expositionItems = try jsonDecoder.decode([ExpositionUniverselleItem].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension KoreaItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) else {
            return UITableViewCell()
        }
        
        let item = expositionItems[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: item.imageName)
        content.text = item.name
        content.secondaryText = item.shortDescription
        cell.contentConfiguration = content
        
        return cell
    }
}

extension KoreaItemsViewController: UITableViewDelegate {
    
}
