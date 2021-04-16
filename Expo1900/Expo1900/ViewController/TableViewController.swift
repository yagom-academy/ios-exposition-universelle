//
//  TableViewController.swift
//  Expo1900
//
//  Created by Yunhwa on 2021/04/16.
//

import UIKit

class TableViewController: UITableViewController {
    
    var koreanItemArr: [KoreanItem] = []
    
    private func koreanItem() throws {
        
        let jsonDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "items") else { throw ExpositionError.noFile }
        guard let koreanItems = try? jsonDecoder.decode([KoreanItem].self, from: dataAsset.data) else {
            throw ExpositionError.decodeFailed
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let koreanItemData: KoreanItem?
        let row = self.koreanItemArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let name = cell.viewWithTag(101) as? UILabel
        let image = cell.viewWithTag(103) as? UIImageView
        let shortDescription = cell.viewWithTag(102) as? UILabel
        
        name?.text = row.name
        shortDescription?.text = row.shortDescription
//        guard let itemData = koreanItemData else { return }
        image?.image = UIImage(named: koreanItemData!.imageName)
        
        return cell

    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.koreanItemArr.count
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 입니다")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try koreanItem()
        } catch {
            print("koreanItemError")
        }
    }
}
   
