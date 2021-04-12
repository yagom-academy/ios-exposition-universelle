//
//  KoreaExhibitItemController.swift
//  Expo1900
//
//  Created by sookim on 2021/04/09.
//

import UIKit

class KoreaExhibitViewController: UIViewController {
    
    @IBOutlet weak var koreaExhibitTableView: UITableView!
    
    private var koreaExhibitItems: [KoreaExhibitItem] = []

    
    override func viewDidLoad() {
        title = "한국의 출품작"
        
        koreaExhibitTableView.delegate = self
        koreaExhibitTableView.dataSource = self
        itemDecode()
    }
    
    private func itemDecode() {
        let jsonDecoder = JSONDecoder()
        guard let koreaExhibitItemsData = NSDataAsset(name: "items")
        else { return }
        
        do {
            koreaExhibitItems = try jsonDecoder.decode([KoreaExhibitItem].self, from: koreaExhibitItemsData.data)
        } catch  {
            print("Error")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ShowDetail" {
                let vc = segue.destination as? ExhibitDetailViewController
                if let select_index = sender as? Int {
                    vc?.koreaItem = koreaExhibitItems[select_index]
                }
            }
    }
}

extension KoreaExhibitViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetail", sender: indexPath.row)
    }
    
}

extension KoreaExhibitViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaExhibitItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = koreaExhibitTableView.dequeueReusableCell(withIdentifier: "koreaExhibitCell", for: indexPath) as! KoreaExhibitItemCell
        
        for i in 0..<koreaExhibitItems.count {
            if koreaExhibitTableView == self.koreaExhibitTableView && indexPath.row == i {
                cell.koreaExhibitImageName.image = UIImage(named: koreaExhibitItems[i].image_name)
                cell.koreaExhibitName.text = koreaExhibitItems[i].name
                cell.koreaExhibitShortDescription.text = koreaExhibitItems[i].short_desc
            }
        }
        return cell
    }
    
}
