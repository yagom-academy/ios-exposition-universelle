//  KoreanItemVC.swift
//  Expo1900
//  Created by 김태현 on 2022/04/14

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
        do {
            koreanItems = try [KoreanHistoricalItem].parse(fileName: "items")
        } catch {
            showFailureAlert(message: "데이터 로드를 실패했습니다.")
        }
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
            showFailureAlert(message: "데이터 로딩에 실패했습니다.")
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
