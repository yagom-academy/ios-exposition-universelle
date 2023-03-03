//
//  ExpoItemListViewController.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/22.
//

import UIKit

final class ExpoItemListViewController: UIViewController {
    private lazy var listTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    var decodedExpoItem: ExpoItemDecoder = ExpoItemDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkValidDecodedData()
        listTableView.reloadData()
        setNavigationBar()
        setupLayout()
    }
    
    private func setNavigationBar() {
        title = "한국의 출품작"
        navigationController?
            .navigationBar
            .topItem?
            .backBarButtonItem = UIBarButtonItem(title: "메인",
                                                 style: .plain,
                                                 target: self,
                                                 action: nil)
    }
    
    private func checkValidDecodedData() {
        do {
            try decodedExpoItem.decodeData()
        } catch {
            presentAlert(title: DecodeError.title, message: error.localizedDescription)
        }
    }
    
    private func presentAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let string = NSLocalizedString("확인", comment: "확인버튼")
        let action = UIAlertAction(title: string, style: .default)
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
    private func setupLayout() {
        view.addSubview(listTableView)
        
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.topAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ExpoItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return decodedExpoItem.expoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        cell.configureCellData(expoItem: decodedExpoItem.expoItems[indexPath.row])
        
        return cell
    }
}

extension ExpoItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navigationController = self.navigationController
        let itemDetailViewController = ItemDetailViewController()
        itemDetailViewController.receiveData(from: decodedExpoItem.expoItems[indexPath.row])
        navigationController?.pushViewController(itemDetailViewController, animated: true)
    }
}
