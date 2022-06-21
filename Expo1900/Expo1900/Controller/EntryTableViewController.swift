//
//  EntryTableViewController.swift
//  Expo1900
//
//  Created by Derrick kim on 2022/06/15.
//

import UIKit

final class EntryTableViewController: UIViewController {
    private let expositionTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var entryEntity: [EntryEntity]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activateOnlyPortraitOrientation(false)
        configureUI()
    }
}

// - MARK: TableView Settings

extension EntryTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let entryEntity = entryEntity {
            return entryEntity.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.expositionTableView.dequeueReusableCell(withIdentifier: EntryTableViewCell.reuseIdentifier, for: indexPath) as? EntryTableViewCell else {
            return UITableViewCell()
        }
        cell.accessoryType = .disclosureIndicator
        
        if let data = entryEntity?[indexPath.row] {
            cell.configure(with: data)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        guard let data = entryEntity?[indexPath.row] else {
            return
        }
        let entryDetailViewController = EntryDetailViewController(data: data)
        self.navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}

// - MARK: View Settings

extension EntryTableViewController {
    private func configureUI() {
        expositionTableView.delegate = self
        expositionTableView.dataSource = self
        
        self.navigationController?.navigationBar.isHidden = false
        self.title = "한국의 출품작"
        self.view.addSubview(expositionTableView)
        
        expositionTableView.estimatedRowHeight = 100
        expositionTableView.rowHeight = UITableView.automaticDimension
        
        NSLayoutConstraint.activate([
            expositionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            expositionTableView.topAnchor.constraint(equalTo: view.topAnchor),
            expositionTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            expositionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        expositionTableView.register(EntryTableViewCell.self, forCellReuseIdentifier: EntryTableViewCell.reuseIdentifier)
        
        fetchData() 
    }
    
    private func fetchData() {
        guard let result = try? JsonParser<[EntryEntity]>.fetch(JSONFile.entryEntity.name) else {
            return
        }
        
        switch result {
        case .success(let data):
            entryEntity = data
        case .failure(let error):
            self.showErrorAlert(message: error.message)
        }
    }
    
    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "뒤로가기", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true)
    }
}
