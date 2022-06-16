//
//  ExpositionTableViewController.swift
//  Expo1900
//
//  Created by Derrick kim on 2022/06/15.
//

import UIKit

final class ExpositionTableViewController: UITableViewController {
    private let expositionTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var entryEntity: [EntryEntity]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        view.addSubview(expositionTableView)
        
        NSLayoutConstraint.activate([
            expositionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            expositionTableView.topAnchor.constraint(equalTo: view.topAnchor),
            expositionTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            expositionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        expositionTableView.register(ExpositionTableViewCell.self, forCellReuseIdentifier: "ExpositionTableViewCell")
        
        expositionTableView.rowHeight = UITableView.automaticDimension
        expositionTableView.estimatedRowHeight = UITableView.automaticDimension
        entryEntity = JsonParser<[EntryEntity]>.fetch("EntryEntity")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let entryEntity = entryEntity {
            return entryEntity.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = expositionTableView.dequeueReusableCell(withIdentifier: "ExpositionTableViewCell", for: indexPath) as? ExpositionTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}
