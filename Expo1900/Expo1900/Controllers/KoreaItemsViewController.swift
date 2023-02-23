//
//  KoreaItemsViewController.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/21.
//

import UIKit

final class KoreaItemsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let cellIdentifier: String = "cell"
    private var expositionItems: [ExpositionUniverselleItem] = []
    
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
        guard let dataAsset = NSDataAsset(name: AssetName.items) else { return }
        
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
        let item = expositionItems[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier),
                let image = UIImage(named: item.imageName)  else {
            return UITableViewCell()
        }
        
        var content = cell.defaultContentConfiguration()
        content.image = image.squareImage()
        content.imageToTextPadding = CGFloat(5)
        content.text = item.name
        content.secondaryText = item.shortDescription
        content.textProperties.font = .preferredFont(forTextStyle: .title1)
        content.secondaryTextProperties.font = .preferredFont(forTextStyle: .body)
        cell.contentConfiguration = content
        
        return cell
    }
}

extension KoreaItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let itemDetailVC = storyboard?.instantiateViewController(identifier: "ItemDetailViewController", creator: { creator in
            let item = self.expositionItems[indexPath.row]
            let viewController = ItemDetailViewController(item: item, coder: creator)
            return viewController
        }) {
            self.navigationController?.pushViewController(itemDetailVC, animated: true)
        }
    }
}
