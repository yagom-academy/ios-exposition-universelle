//  KoreaEntitiesViewController.swift
//  KoreaEntitiesViewController
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import UIKit

class KoreaEntitiesViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(EntityTableCell.self, forCellReuseIdentifier: EntityTableCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var entities: [Entity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setNavBar()
        
        entities = decode()
    }
    
    private func decode() -> [Entity] {
        let jsonDecoder = JSONDecoder()
        let json = NSDataAsset(name: Constant.entitiesFileName)
        let data = json?.data ?? Data()
        
        guard let result = try? jsonDecoder.decode([Entity].self, from: data) else {
            return []
        }
        
        return result
    }
    
    private func setLayout() {
        view.addSubview(tableView)
        
        setTableViewLayout()
    }
    
    private func setNavBar() {
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(false, animated: true)
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = EntityDetailViewController()
        let entity = entities[indexPath.row]
        
        vc.setImageView(imageName: entity.imageName)
        vc.setDescriptionLabel(description: entity.description)
        vc.navigationItem.title = entity.name
        
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension KoreaEntitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EntityTableCell.identifier) as? EntityTableCell else {
            return UITableViewCell()
        }
        
        let entity = entities[indexPath.row]
        cell.setViewData(entity: entity)
        
        return cell
    }
}
