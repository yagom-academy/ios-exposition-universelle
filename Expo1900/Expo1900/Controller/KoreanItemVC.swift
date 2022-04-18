//
//  KoreanItemVC.swift
//  Expo1900
//
//  Created by 김태현 on 2022/04/14.
//

import UIKit

final class KoreanItemVC: UIViewController {
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

extension KoreanItemVC {
    private func initializeKoreanItemsData() {
        guard let items = try? [KoreanHistoricalItem].decode(from: "items") else {
            return
        }
        koreanItems = items
    }
}

extension KoreanItemVC: UITableViewDelegate, UITableViewDataSource {
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
            return UITableViewCell()
        }
        cell.assignKoreanItemValue(with: koreanItems[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let koreanItemDetailVC = storyboard?.instantiateViewController(withIdentifier: KoreanItemDetailVC.identifier) as? KoreanItemDetailVC else {
            return
        }
        koreanItemDetailVC.koreanItem = koreanItems?[indexPath.row]
        navigationController?.pushViewController(koreanItemDetailVC, animated: true)
    }
}

extension KoreanItemVC {
    private func showFailureAlert() {
        let alertController = UIAlertController(title: nil, message: "적절한 셀을 찾을 수 없습니다!", preferredStyle: .alert)
        let confirmButton = UIAlertAction(title: "ok", style: .default)
        alertController.addAction(confirmButton)
        present(alertController, animated: true)
    }
}
