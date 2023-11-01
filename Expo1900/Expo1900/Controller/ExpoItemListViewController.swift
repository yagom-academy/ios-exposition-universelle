//
//  ExpoItemListViewController.swift
//  Expo1900
//
//  Created by Kiseok on 2023/11/01.
//

import UIKit

final class ExpoItemListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var exhibitionItems: [ExhibitionItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parsingToExhibitionItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func parsingToExhibitionItems() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            self.exhibitionItems = try jsonDecoder.decode([ExhibitionItems].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
