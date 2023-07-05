//
//  ExhibitListViewController.swift
//  Expo1900
//
//  Created by karen on 2023/07/04.
//

import UIKit

final class ExhibitListViewController: UIViewController {
    private let expositionItemEntity: [ExhibitionItem]
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(ExhibitCell.self, forCellReuseIdentifier: DataNamespace.cellIdentifier)
        return tableView
    }()
    
    init(expositionItems: [ExhibitionItem]) {
        self.expositionItemEntity = expositionItems
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = DataNamespace.koreanItem
        view.backgroundColor = .systemBackground
        
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ExhibitListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItemEntity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataNamespace.cellIdentifier, for: indexPath) as? ExhibitCell else { return ExhibitCell() }
        
        let exhibit = expositionItemEntity[indexPath.row]
        cell.configureCell(with: exhibit)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exhibit = expositionItemEntity[indexPath.row]
        let detailViewController = ExhibitDetailViewController(expositionItemDetail: exhibit)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
