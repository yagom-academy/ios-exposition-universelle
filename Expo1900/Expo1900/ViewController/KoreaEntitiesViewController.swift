//
//  ViewController.swift
//  Expo1900
//
//  Created by 이정민 on 2022/10/24.
//

import UIKit

class KoreaEntitiesViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(EntityTableCell.self, forCellReuseIdentifier: "EntityTableCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        setLayout()
    }
    
    private func setLayout() {
        view.addSubview(tableView)
        
        setTableViewLayout()
    }
    
    private func setTableViewLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
}

extension KoreaEntitiesViewController: UITableViewDelegate {
    
}

extension KoreaEntitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntityTableCell") as? EntityTableCell else {
            return UITableViewCell()
        }
        
//        cell.entityImageView.image = UIImage(named: "buddhism")
//        cell.titleLabel.text = indexPath.row.description
//        cell.subTitleLabel.text = "example"
        
        return cell
    }
}
