//
//  SecondViewController.swift
//  Expo1900
//
//  Created by 오승기 on 2021/07/08.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var informationOfKoreanHeritages: [InformationOfKoreanHeritage] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        do {
            self.informationOfKoreanHeritages = try jsonDecoder.decode([InformationOfKoreanHeritage].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
