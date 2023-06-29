//
//  ExpositionItemViewController.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/29.
//

import UIKit

class ExpositionItemViewController: UIViewController, UITableViewDelegate {
    private let expositionItemEntity = DecodingManager().decodeExpositionItemsJSON()
    private let identifier: String = IdentifierNamespace.cell
    private var isSetUpEntity: Bool = false
    
    private let tableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = ViewControllerTitleNamespace.koreanItem
        
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(tableView)
        
        tableView.register(ExpositionItemTableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView
                .topAnchor
                .constraint(equalTo: view.topAnchor),
            tableView
                .leftAnchor
                .constraint(equalTo: view.leftAnchor),
            tableView
                .rightAnchor
                .constraint(equalTo: view.rightAnchor),
            tableView
                .bottomAnchor
                .constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureErrorLabel() {
        let errorLabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = LabelTextNameSpace.errorMessage
            
            return label
        }()
        
        view.addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            errorLabel
                .centerXAnchor
                .constraint(equalTo: view.centerXAnchor),
            errorLabel
                .centerYAnchor
                .constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension ExpositionItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItemEntity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
                as? ExpositionItemTableViewCell
        else {
            return ExpositionItemTableViewCell()
        }
        
        cell.image.image = UIImage(named: expositionItemEntity[indexPath.row].imageName)
        cell.name.text = expositionItemEntity[indexPath.row].name
        cell.shortDescription.text = expositionItemEntity[indexPath.row].shortDescription
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = ExpositionItemDetailViewController(
            expositionItemDetail: expositionItemEntity[indexPath.row]
        )
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
