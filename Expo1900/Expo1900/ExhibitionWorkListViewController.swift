//
//  ExhibitionWorkListViewController.swift
//  Expo1900
//
//  Created by Som, Stone, Aaron on 2022/10/20.
//

import UIKit

class ExhibitionWorkListViewController: UIViewController {
    @IBOutlet weak var exhibitionWorkTableView: UITableView!
    
    let cellIdentifier: String = "cell"
    var exhibitionWork: [ExhibitionWork] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpJSONData()
    }
    
    func setUpJSONData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            exhibitionWork = try jsonDecoder.decode([ExhibitionWork].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        self.exhibitionWorkTableView.reloadData()
    }
}


