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
            setUpTable()
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
        
        tableView.reloadData()
    }
    
    private func setUpTable() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "KoreaItemTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}

// MARK: - extensions
extension KoreaItemsViewController {
    func showErrorAlert(_ alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
}

extension KoreaItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.koreaItemsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! KoreaItemTableViewCell
        let koreaItem = self.koreaItemsData[indexPath.row]
        let koreaItemImage = UIImage(named: koreaItem.imageName)
        cell.itemImage.image = koreaItemImage
        cell.itemTitle.text = koreaItem.name
        cell.itemShortDescription.text = koreaItem.shortDescription
        
        return cell
    }
    
}

extension KoreaItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
