//
//  KoreaExhibitItemController.swift
//  Expo1900
//
//  Created by sookim on 2021/04/09.
//

import Foundation
import UIKit

class KoreaExhibitItemController: UIViewController {
    
    @IBOutlet weak var koreaExhibitTableView: UITableView!
    
    private var koreaExhibitItems: [KoreaExhibitItem] = []

    
    override func viewDidLoad() {
        title = "한국의 출품작"
        
        koreaExhibitTableView.delegate = self
        koreaExhibitTableView.dataSource = self
        
        let jsonDecoder = JSONDecoder()
        guard let koreaExhibitItemsData = NSDataAsset(name: "items")
        else { return }
        
        do {
            koreaExhibitItems = try jsonDecoder.decode([KoreaExhibitItem].self, from: koreaExhibitItemsData.data)
        } catch  {
            print("Error")
        }
        print(koreaExhibitItems)
    }
}

extension KoreaExhibitItemController: UITableViewDelegate {
    
}

extension KoreaExhibitItemController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("아이템수: \(koreaExhibitItems.count)")
        return koreaExhibitItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = koreaExhibitTableView.dequeueReusableCell(withIdentifier: "koreaExhibitCell", for: indexPath) as! KoreaExhibitItemCell
        
        for i in 0..<koreaExhibitItems.count {
            if koreaExhibitTableView == self.koreaExhibitTableView && indexPath.row == i {
                print("i 번호 : \(i)")
                print("row 번호 : \(indexPath.row)")
                cell.koreaExhibitImageName.image = UIImage(named: koreaExhibitItems[i].image_name)
                cell.koreaExhibitName.text = koreaExhibitItems[i].name
                cell.koreaExhibitShortDescription.text = koreaExhibitItems[i].short_desc
            }
        }
        
        return cell
    }
    
    
}
