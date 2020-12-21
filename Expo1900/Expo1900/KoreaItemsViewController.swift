//
//  KoreaItemsViewController.swift
//  Expo1900
//
//  Created by Wonhee on 2020/12/22.
//

import UIKit

class KoreaItemsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    private let koreaItemsViewControllerTitle = "한국의 출품작"
    
    // MARK: - data property
    private var koreaItemsData: [KoreaItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            setUpNavigationBar()
            try initKoreaItemsData()
        } catch {
            let alert = self.errorAlert(error: error, handler: nil)
            self.showErrorAlert(alert)
        }
    }
    
    private func setUpNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.title = koreaItemsViewControllerTitle
    }
    
    private func initKoreaItemsData() throws {
        let jsonDecoder = JSONDecoder()
        guard let koreaItemsJsonData: NSDataAsset = NSDataAsset(name: "items") else {
            throw ExpositionError.getKoreaItemsData
        }
        self.koreaItemsData = try jsonDecoder.decode([KoreaItem].self, from: koreaItemsJsonData.data)
    }
}

// MARK: - extensions
extension KoreaItemsViewController {
    func showErrorAlert(_ alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
}

extension KoreaItemsViewController: UITableViewDataSource {
    
}

extension KoreaItemsViewController: UITableViewDelegate {
    
}
