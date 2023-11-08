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
        
        decodeExpositionItems()
    }
    
    private func decodeExpositionItems() {
        do {
            expositionItems = try AssetDecoder<[ExpositionItem]>().parse(assetName: AssetNameList.expositionItems)
        } catch {
            self.showAlert(error)
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.itemCell, for: indexPath)
        let item = expositionItems[indexPath.row]

        cell.contentConfiguration = configureContent(of: cell, from: item)
        
        return cell
    }
    
    private func configureContent(of cell: UITableViewCell, from item: ExpositionItem) -> UIListContentConfiguration {
        var content = cell.defaultContentConfiguration()
        
        content.text = item.name
        content.textProperties.font = UIFont.preferredFont(forTextStyle: .title1)
        
        content.secondaryText = item.shortDescription
        content.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .body)
        
        let imageWidth = 60
        let imageSize = CGSize(width: imageWidth, height: imageWidth)
        content.image = UIImage(named: item.imageName)
        content.imageProperties.maximumSize = imageSize
        content.imageProperties.reservedLayoutSize = imageSize
        
        return content
    }
}
