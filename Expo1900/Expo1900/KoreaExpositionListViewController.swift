//
//  KoreaExpositionListViewController.swift
//  Expo1900
//
//  Created by Yeon on 2020/12/22.
//

import Foundation
import UIKit

class KoreaExpositionListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var koreaExpositionItems: [KoreaExpositionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        decodeData()
    }
    
    private func setNavigationBar() {
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "메인"
        self.navigationItem.title = "한국의 출품작"
    }
    
    private func decodeData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        do {
            self.koreaExpositionItems = try jsonDecoder.decode([KoreaExpositionItem].self, from: dataAsset.data)
        } catch {
            print(error)
        }
    }
    
}
