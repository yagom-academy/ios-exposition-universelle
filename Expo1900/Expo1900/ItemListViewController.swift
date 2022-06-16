//
//  ItemListViewController.swift
//  Expo1900
//
//  Created by seohyeon park on 2022/06/16.
//

import UIKit

class ItemListViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        addTableView()
        constraintTableViewLayout()
        tableView.rowHeight = 100
    }
    
    private func addTableView() {
        self.view.addSubview(tableView)
    }
    
    private func constraintTableViewLayout() {
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func configureTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = "안녕"
        return cell
    }
}

extension ItemListViewController: UITableViewDelegate {
    
}
