//
//  ItemEntryViewController.swift
//  Expo1900
//
//  Created by 리지, Rowan on 2023/02/22.
//

import UIKit

final class ItemEntryViewController: UIViewController, ContentsDataSource {
    private var items: [Item] = []
    var selectedItem: Item?
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        setNavigationBar()
        decodeItemsData()
    }
    
    private func setNavigationBar() {
        let navigationBarTitle = "한국의 출품작"
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = navigationBarTitle
    }
    
    private func decodeItemsData() {
        let jsonDecoder = JSONDecoder()
        let assetName = "items"
        guard let dataAsset = NSDataAsset(name: assetName) else { return }
        
        do {
            self.items = try jsonDecoder.decode([Item].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private enum Identifier {
        static let cell = "cell"
        static let descriptionViewController = "descriptionViewController"
    }
}

// MARK: DataSource
extension ItemEntryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: Identifier.cell, for: indexPath
        )
        
        setContents(of: cell, at: indexPath)
        
        return cell
    }
    
    private func setContents(of cell: UITableViewCell, at indexPath: IndexPath) {
        guard let itemImage = UIImage(named: items[indexPath.row].imageName) else { return }
        let resizedItemImage = resize(itemImage, length: 70)
        var customConfiguration = cell.defaultContentConfiguration()
        
        customConfiguration.text = items[indexPath.row].name
        customConfiguration.textProperties.font = UIFont.systemFont(ofSize: 25)
        
        customConfiguration.secondaryText = items[indexPath.row].shortDescription
        customConfiguration.secondaryTextProperties.font = UIFont.systemFont(ofSize: 18)
        customConfiguration.secondaryTextProperties.numberOfLines = 0
        customConfiguration.secondaryTextProperties.lineBreakMode = .byWordWrapping
        
        customConfiguration.image = resizedItemImage
        
        cell.contentConfiguration = customConfiguration
        cell.accessoryType = .disclosureIndicator
    }
    
    private func resize(_ image: UIImage, length: CGFloat) -> UIImage? {
        let longSide = max(image.size.width, image.size.height)
        let scale = length / longSide
        var newHeight: CGFloat
        var newWidth: CGFloat
        
        if longSide == image.size.width {
            newWidth = length
            newHeight = image.size.height * scale
        } else {
            newWidth = image.size.width * scale
            newHeight = length
        }
        
        UIGraphicsBeginImageContext(CGSizeMake(length, length))
        image.draw(in: CGRectMake((length - newWidth) / 2,
                                  (length - newHeight) / 2,
                                  newWidth,
                                  newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

// MARK: Delegate
extension ItemEntryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextViewController = self
            .storyboard?
            .instantiateViewController(
                withIdentifier: Identifier.descriptionViewController
            ) as? DescriptionViewController else { return }
        
        self.selectedItem = items[indexPath.row]
        nextViewController.dataSource = self
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        nextViewController.navigationItem.title = items[indexPath.row].name
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
