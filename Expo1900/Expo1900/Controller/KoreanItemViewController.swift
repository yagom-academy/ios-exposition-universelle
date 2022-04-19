//  KoreanItemVC.swift
//  Expo1900
//  Created by 김태현 on 2022/04/14

import UIKit

fileprivate enum UItitle {
    static let koreaItemsText = "한국의 출품작"
}

fileprivate enum CellIdentifier {
    static let empty = "empty cell"
}

final class KoreanItemViewController: UIViewController {
    var koreanItems: [KoreanHistoricalItem]?
    
    @IBOutlet weak var koreanItemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateDelegateProperties()
        initializeKoreanItemsData()
        navigationItem.title = UItitle.koreaItemsText
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
            koreanItems = try [KoreanHistoricalItem].parse(fileName: FileName.items)
        } catch {
            showFailureAlert(message: AlertMessage.notFoundData)
        }
    }
}

extension KoreanItemViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let koreanItemsCount = koreanItems?.count {
            return koreanItemsCount
        }
        return .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KoreanItemTableViewCell.identifier, for: indexPath) as? KoreanItemTableViewCell,
           let koreanItems = koreanItems else {
            showFailureAlert(message: AlertMessage.notFoundData)
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier.empty)
            return tableView.dequeueReusableCell(withIdentifier: CellIdentifier.empty, for: indexPath)
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
