//
//  ItemListViewController.swift
//  Expo1900
//
//  Created by seohyeon park on 2022/06/16.
//

import UIKit

class ItemListViewController: UIViewController {
    private let entryData = DataManager().entryParse(fileName: "items")
    private let backButton = UIBarButtonItem(title: "메인", style: .plain, target: nil, action: nil)
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "한국의 출품작"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        configureTableView()
        setTableView()
        setTableViewLayout()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setTableView() {
        self.view.addSubview(tableView)
    }
    
    private func setTableViewLayout() {
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func configureTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = entryData[indexPath.row]!.name
        cell.shortDescriptionLabel.text = entryData[indexPath.row]!.shortDescription
        
        
        let name = entryData[indexPath.row]!.imageName
        cell.itemImageView.image = UIImage(named: name)
        return cell
    }
}

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailView = self.storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailViewController else { return }
        detailView.itemData = entryData[indexPath.row]
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}
