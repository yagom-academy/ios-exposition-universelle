//
//  ExhibitListViewController.swift
//  Expo1900
//
//  Created by karen on 2023/07/04.
//

import UIKit

final class ExhibitListViewController: UIViewController {
    private let expositionItemEntity = ExpositionDataManager().decodeExpositionItemsJSON()
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(ExhibitCell.self, forCellReuseIdentifier: DataNamespace.cellIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = DataNamespace.koreanItem
        view.backgroundColor = .systemBackground
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ExhibitListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItemEntity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataNamespace.cellIdentifier, for: indexPath) as? ExhibitCell else { return ExhibitCell() }
        
        let exhibit = expositionItemEntity[indexPath.row]
        cell.configureCell(with: exhibit)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}
