//
//  KoreanItemVC.swift
//  Expo1900
//
//  Created by 김태현 on 2022/04/14.
//

import UIKit

final class KoreanItemViewController: UIViewController {
    var koreanItems: [KoreanHistoricalItem]?
    
    @IBOutlet weak var koreanItemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateDelegateProperties()
        initializeKoreanItemsData()
        navigationItem.title = "한국의 출품작"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    private func configurateDelegateProperties() {
        koreanItemsTableView.delegate = self
        koreanItemsTableView.dataSource = self
    }
}

extension KoreanItemViewController {
    private func initializeKoreanItemsData() {
        guard let items = try? [KoreanHistoricalItem].convert(from: "items") else {
            return
        }
        koreanItems = items
    }
}

extension KoreanItemViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let koreanItemsCount = koreanItems?.count {
            return koreanItemsCount
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KoreanItemTableViewCell.identifier, for: indexPath) as? KoreanItemTableViewCell,
           let koreanItems = koreanItems else {
            showFailureAlert()
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "empty cell")
            return tableView.dequeueReusableCell(withIdentifier: "empty cell", for: indexPath)
        }
        cell.assignValue(from: koreanItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let koreanItemDetailVC = storyboard?.instantiateViewController(withIdentifier: KoreanItemDetailViewController.identifier) as? KoreanItemDetailViewController else {
            return
        }
        koreanItemDetailVC.koreanItem = koreanItems?[indexPath.row]
        navigationController?.pushViewController(koreanItemDetailVC, animated: true)
    }
}

extension KoreanItemViewController {
    private func showFailureAlert() {
        let alertController = UIAlertController(title: nil, message: "적절한 데이터를 불러올 수 없습니다.", preferredStyle: .alert)
        let confirmButton = UIAlertAction(title: "ok", style: .default)
        alertController.addAction(confirmButton)
        present(alertController, animated: true)
    }
}
