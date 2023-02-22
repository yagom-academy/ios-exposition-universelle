//
//  ItemEntryViewController.swift
//  Expo1900
//
//  Created by 리지, Rowan on 2023/02/22.
//

import UIKit

final class ItemEntryViewController: UITableViewController {
    private var items: [Item] = []
    
    override func viewDidLoad() {
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        setContents(of: cell, at: indexPath)
        
        return cell
    }
    
    private func setContents(of cell: UITableViewCell, at indexPath: IndexPath) {
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
        
        cell.detailTextLabel?.lineBreakMode = .byWordWrapping
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 18)
        
        guard let itemImage = UIImage(named: items[indexPath.row].imageName) else { return }
        let resizedItemImage = resizeImage(image: itemImage, newWidth: 70)
        
        cell.textLabel?.text = items[indexPath.row].name
        cell.detailTextLabel?.text = items[indexPath.row].shortDescription
        cell.imageView?.image = resizedItemImage
        
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
