//
//  ExpositionItemViewController.swift
//  Expo1900
//
//   Created by jyubong, mireu
//

import UIKit

final class ExpositionItemListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var expositionItems: [ExpositionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        expositionItems = AssetDecoder<[ExpositionItem]>(assetName: "items").decodedItem ?? []
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController = segue.destination as? ExpositionItemDetailViewController else { return }
        
        guard let selectedIndex = tableView.indexPathForSelectedRow else { return }
        
        nextViewController.setUpExpositionItem(to: expositionItems[selectedIndex.row])
        
        tableView.deselectRow(at: selectedIndex, animated: false)
    }
}

extension ExpositionItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        let item = expositionItems[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = item.name
        content.secondaryText = item.shortDescription
        content.image = UIImage(named: item.imageName)
        
        let imageSize = CGSize(width: 60, height: 60)
        content.imageProperties.maximumSize = imageSize
        content.imageProperties.reservedLayoutSize = imageSize
        
        cell.contentConfiguration = content
        
        return cell
    }
}
