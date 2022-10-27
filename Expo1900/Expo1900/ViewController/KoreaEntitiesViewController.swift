//  KoreaEntitiesViewController.swift
//  KoreaEntitiesViewController
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import UIKit

final class KoreaEntitiesViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(EntityTableCell.self, forCellReuseIdentifier: EntityTableCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private var entities: [Entity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setLayout()
        setUpItems()
    }
}


// MARK: - UITableViewDelegate
extension KoreaEntitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entity = entities[indexPath.row]
        let destinationViewController = EntityDetailViewController(entity: entity)
        
        navigationController?.pushViewController(destinationViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource
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

// MARK: - Data 관련 메서드
private extension KoreaEntitiesViewController {
    func setUpItems() {
        do {
            let jsonDecoder = JSONDecoder()
            let decodedValues: [Entity] = try jsonDecoder.decode(fileName: Constant.entitiesFileName)
            entities = decodedValues
        } catch {
            print(error.localizedDescription)
        }
    }
}

//MARK: - layout 설정
private extension KoreaEntitiesViewController {
    func setLayout() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        setTableViewLayout()
    }
    
    func setNavBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.topItem?.backButtonTitle = Constant.mainName
    }
    
    func setTableViewLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
}
