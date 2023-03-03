//
//  ItemEntryViewController.swift
//  Expo1900
//
//  Created by 리지, Rowan on 2023/02/22.
//

import UIKit

final class ItemEntryViewController: UIViewController {
    private var items: [Item] = []
    
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
        let assetName = "items"
        
        self.items = DecodeManager.decodeData(of: assetName, returnType: [Item].self) ?? []
    }
    
    private enum Identifier {
        static let cell = "customCell"
        static let descriptionViewController = "descriptionViewController"
    }
}

// MARK: DataSource
extension ItemEntryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Identifier.cell, for: indexPath
        ) as? CustomTableViewCell else { return UITableViewCell() }
        
        let itemName = items[indexPath.row].name
        let shortDescription = items[indexPath.row].shortDescription
        let itemImage = UIImage(named: items[indexPath.row].imageName) ?? nil
        
        cell.setContents(itemName, shortDescription, itemImage)
        setAccessibilityProperties(of: cell, itemName: itemName, shortDescription: shortDescription)
        
        return cell
    }
}

// MARK: Delegate
extension ItemEntryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextViewController = self.storyboard?.instantiateViewController(
            identifier: Identifier.descriptionViewController,
            creator: { creator in
                let item = self.items[indexPath.row]
                let nextViewController = DescriptionViewController(item: item, coder: creator)
                
                return nextViewController
            }
        ) else { return }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ItemEntryViewController {
    private func setAccessibilityProperties(
        of cell: CustomTableViewCell,
        itemName: String,
        shortDescription: String
    ) {
        cell.isAccessibilityElement = false
        cell.accessibilityElements = [
            cell.itemNameLabel!,
            cell.shortDescriptionLabel!,
            cell.itemImageView!
        ]
        
        setLabelAccessibility(in: cell, itemName: itemName, shortDescription: shortDescription)
        setImageViewAccessibility(in: cell, itemName: itemName)
    }
    
    private func setLabelAccessibility(
        in cell: CustomTableViewCell,
        itemName: String,
        shortDescription: String
    ) {
        cell.itemNameLabel.accessibilityLabel = itemName
        cell.shortDescriptionLabel.accessibilityLabel = "짧은 설명"
        cell.shortDescriptionLabel.accessibilityValue = shortDescription
    }
    
    private func setImageViewAccessibility(in cell: CustomTableViewCell, itemName: String) {
        cell.itemImageView.isAccessibilityElement = true
        cell.itemImageView.accessibilityLabel = itemName
        cell.itemImageView.accessibilityTraits = .image
        cell.itemImageView.accessibilityHint = "현재 셀을 선택하면 상세 화면으로 이동합니다."
    }
}
