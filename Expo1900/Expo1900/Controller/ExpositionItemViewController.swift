//
//  ExpositionItemViewController.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/29.
//

import UIKit

class ExpositionItemViewController: UIViewController, UITableViewDelegate {
    private var expositionItemEntity: [ExpositionItemEntity] = []
    private let identifier: String = IdentifierNamespace.itemTableCell
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = ViewControllerTitleNamespace.koreanItem
        
        do {
            expositionItemEntity = try DecodingManager.shared.decodeJSON(fileName: AssetNamespace.items, type: [ExpositionItemEntity].self)
            
            configureUI()
        } catch DecodingError.failedDecoding {
            ErrorLabel(DecodingError.failedDecoding.message, frame: view.frame).configureUI(view)
        } catch {
            ErrorLabel(DecodingError.unknown.message, frame: view.frame).configureUI(view)
        }
    }
    
    private func configureUI() {
        view.addSubview(tableView)
        
        tableView.register(ExpositionItemTableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
        
        cell.inputDataToCell(data: expositionItemEntity[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailViewController = ExpositionItemDetailViewController(
            expositionItemDetail: expositionItemEntity[indexPath.row]
        )
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
