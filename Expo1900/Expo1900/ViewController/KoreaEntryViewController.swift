//
//  KoreaEntryViewController.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/28.
//

import UIKit

final class KoreaEntryViewController: UIViewController {
    private lazy var dataSource: KoreaEntryDataSource = {
        let dataSource = KoreaEntryDataSource()
        dataSource.loadKoreaEntryInformation()
        return dataSource
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.basicCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setUpTableViewConstraints()
        navigationItem.title = "한국의 출품작"
    }
    
    private func configureUI() {
        view.addSubview(tableView)
    }
    
    private func setUpTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - TableView Delegate
extension KoreaEntryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let entryInformation = dataSource.sendEntryInformation(index: indexPath.row) else { return }
        let entryDetailViewController = EntryDetailViewController()
        
        entryDetailViewController.setEntryDetailInformation(entryInformation.name,
                                                             entryInformation.imageName,
                                                             entryInformation.description)
        navigationController?.pushViewController(entryDetailViewController, animated: true)
        navigationItem.backButtonTitle = "한국의 출품작"
    }
}
