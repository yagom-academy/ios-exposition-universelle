//
//  ItemEntryViewController.swift
//  Expo1900
//
//  Created by 리지, Rowan on 2023/02/22.
//

import UIKit

final class ItemEntryViewController: UIViewController {
    private var items: [Item] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        setNavigationBar()
        decodeItemsData()
    }
    
    private func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "한국의 출품작"
    }
    
    private func decodeItemsData() {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            self.items = try jsonDecoder.decode([Item].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: DataSource
extension ItemEntryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "cell", for: indexPath
        )
        
        setContents(of: cell, at: indexPath)
        
        return cell
    }
    
    private func setContents(of cell: UITableViewCell, at indexPath: IndexPath) {
        guard let itemImage = UIImage(named: items[indexPath.row].imageName) else { return }
        let resizedItemImage = resizeImage(image: itemImage, newWidth: 70)
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
        
        cell.detailTextLabel?.lineBreakMode = .byWordWrapping
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 18)
        
        cell.imageView?.image = resizedItemImage
        cell.textLabel?.text = items[indexPath.row].name
        cell.detailTextLabel?.text = items[indexPath.row].shortDescription
        cell.accessoryType = .disclosureIndicator
    }
    
    private func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.draw(in: CGRectMake(0, 0, newWidth, newHeight))
        
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
                withIdentifier:"descriptionViewController"
            ) as? DescriptionViewController else { return }
        
        nextViewController.addItem(items[indexPath.row])
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
