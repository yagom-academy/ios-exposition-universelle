//
//  ItemListViewController.swift
//  Expo1900
//
//  Created by Hemg, RedMango on 2023/06/28.
//

import UIKit

final class ItemListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var items = [Item]()
    private weak var alertDelegate: AlertProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        alertDelegate = self
        showNavigationBar()
        loadItems()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func showNavigationBar() {
        self.title = "한국의 출품작"
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: "ItemListTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "ItemListTableViewCell")
    }
    
    private func loadItems() {
        let decoder = JSONDecoder()
        
        guard let asset = NSDataAsset(name: "items") else {
            alertDelegate?.showAlert(message:  "파일을 불러오는데 실패했습니다.")
            return
        }
        
        do {
            items = try decoder.decodingContentInfo(with: asset.data, modelType: [Item].self)
        } catch {
            alertDelegate?.showAlert(message:  "파일이 손상되었거나 형식에 맞지 않습니다.")
        }
    }
}

extension ItemListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: "ItemListTableViewCell", for: indexPath)
                as? ItemListTableViewCell else {
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]

        cell.itemImageView.image = UIImage(named: item.imageName)
        cell.titleLabel.text = item.name
        cell.shortDescriptionLabel.text = item.shortDescription
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let detailItemViewController = storyboard
            .instantiateViewController(identifier: "DetailItemViewController") { coder in
                DetailItemViewController(item: item, coder: coder) }
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(detailItemViewController, animated: true)
    }
}

extension ItemListViewController: AlertProtocol {
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let confirmAction: UIAlertAction = UIAlertAction(title: "확인", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(confirmAction)
        present(alert, animated: true)
    }
}
