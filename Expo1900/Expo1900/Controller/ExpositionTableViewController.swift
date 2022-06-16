//
//  ExpositionTableViewController.swift
//  Expo1900
//
//  Created by Derrick kim on 2022/06/15.
//

import UIKit

final class ExpositionTableViewController: UIViewController {
    private let expositionTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var entryEntity: [EntryEntity]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        entryEntity = JsonParser<[EntryEntity]>.fetch("EntryEntity")
    }
}

extension ExpositionTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let entryEntity = entryEntity {
            return entryEntity.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.expositionTableView.dequeueReusableCell(withIdentifier: "ExpositionTableViewCell", for: indexPath) as? ExpositionTableViewCell else {
            return UITableViewCell()
        }
        cell.accessoryType = .disclosureIndicator
        
        if let data = entryEntity?[indexPath.row] {
            cell.configure(with: data)
        }
        
        return cell
    }
}

extension ExpositionTableViewController {
    private func configureUI() {
        expositionTableView.delegate = self
        expositionTableView.dataSource = self
        
        self.navigationController?.navigationBar.isHidden = false
        self.title = "한국의 출품작"
        self.view.addSubview(expositionTableView)
        
        expositionTableView.rowHeight = UITableView.automaticDimension
        expositionTableView.estimatedRowHeight = UITableView.automaticDimension
        
        NSLayoutConstraint.activate([
            expositionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            expositionTableView.topAnchor.constraint(equalTo: view.topAnchor),
            expositionTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            expositionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        expositionTableView.register(ExpositionTableViewCell.self, forCellReuseIdentifier: "ExpositionTableViewCell")
    }
}
