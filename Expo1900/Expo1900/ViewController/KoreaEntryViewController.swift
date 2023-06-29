//
//  KoreaEntryViewController.swift
//  Expo1900
//
//  Created by Hyun A Song on 2023/06/28.
//

import UIKit

class KoreaEntryViewController: UIViewController, UITableViewDelegate {
    lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        view.backgroundColor = .brown
        
        navigationItem.backButtonTitle = "한국의 출품작"
        navigationItem.title = "한국의 출품작"
        
        setUpTableViewConstraints()
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
