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
    
    var entities: [Entity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        setLayout()
        
        guard let decodedValues = decode() else {
            return
        }
        
        entities = decodedValues
        
    }
    
    private func decode() -> [Entity]? {
        let jsonDecoder = JSONDecoder()
        let json = NSDataAsset(name: "items")
        
        guard let result = try? jsonDecoder.decode([Entity].self, from: json?.data ?? Data()) else {
            return nil
        }
        
        return result
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
        return entities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntityTableCell") as? EntityTableCell else {
            return UITableViewCell()
        }
        
        let entity = entities[indexPath.row]
        cell.setViewData(entity: entity)
        
        return cell
    }
}
