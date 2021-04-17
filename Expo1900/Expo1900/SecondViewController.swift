//
//  SecondViewController.swift
//  Expo1900
//
//  Created by Sunny on 2021/04/14.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    var koreanItems: [KoreanItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "한국의 출품작"
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            self.koreanItems = try jsonDecoder.decode([KoreanItem].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }

        self.tableView.reloadData()
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.koreanItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let item: KoreanItem = self.koreanItems[indexPath.row]
        cell.textLabel?.text = item.koreanTitle
        cell.imageView?.image = UIImage(named: item.englishTitle)
        cell.detailTextLabel?.text = item.shortDescription
        return cell
    }
    
}
