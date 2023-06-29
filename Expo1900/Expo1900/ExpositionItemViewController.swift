//
//  ExpositionItemViewController.swift
//  Expo1900
//
//  Created by Min Hyun on 2023/06/29.
//

import UIKit

class ExpositionItemViewController: UIViewController, UITableViewDelegate {
    private var expositionItemEntity: [ExpositionItemEntity] = []
    private let identifier = "cell"
    
    private let tableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
       return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setUpEntity() {
        guard let entity = NSDataAsset(name: "items") else {
            return
        }
        
        let decorder = JSONDecoder()
        
        do {
            expositionItemEntity = try decorder.decode([ExpositionItemEntity].self, from: entity.data)
        } catch {
        }
    }
}


extension ExpositionItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItemEntity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        return cell
    }
}
