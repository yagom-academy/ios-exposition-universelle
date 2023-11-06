//
//  ExpoItemListViewController.swift
//  Expo1900
//
//  Created by Kiseok, Toy on 2023/11/01.
//

import UIKit

final class ExpoItemListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var exhibitionItems: [ExhibitionItem] = []
    private var exhibitionItemsData = DataDecoder<[ExhibitionItem]>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        parseData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    private func showAppTerminatingAlert() {
        let title = "시스템 오류가 발생했습니다."
        let message = "Data를 불러오는데 실패했습니다. 앱이 종료됩니다."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert) 
        let terminateAction = UIAlertAction(title: "지금 종료", style: .destructive) { _ in
            exit(1)
        }
            
        alert.addAction(terminateAction)
        present(alert, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let itemDescriptionViewController = segue.destination as? ItemDescriptionViewController else {
            return
        }
        let cellIndexPath = tableView.indexPathForSelectedRow
        guard let rowOfIndexPath: Int = cellIndexPath?.row else {
            return
        }
        
        itemDescriptionViewController.setUp(asset: exhibitionItems[rowOfIndexPath])
    }
    
    private func parseData() {
        do {
            exhibitionItems = try exhibitionItemsData.parse(assetName: "tems")
        } catch {
            self.showAppTerminatingAlert()
        }
    }
}

extension ExpoItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exhibitionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpoItemCell", for: indexPath) as? ExpoItemCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(asset: self.exhibitionItems[indexPath.row])
        
        return cell
    }
}
