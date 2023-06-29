//
//  ExpositionItemListViewController.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/06/28.
//

import UIKit

class ExpositionItemListViewController: UIViewController {

    private let itemListTableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .brown
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        itemListTableView.delegate = self
        itemListTableView.dataSource = self
        itemListTableView.register(ItemUITableViewCellStyleSubtitle.self, forCellReuseIdentifier: "cell")
        view.addSubview(itemListTableView)
        
        NSLayoutConstraint.activate([
            itemListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            itemListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            itemListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            itemListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ExpositionItemListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemUITableViewCellStyleSubtitle else { return UITableViewCell() }
        
        cell.textLabel?.text = "title"
        cell.detailTextLabel?.text = "subtitle"
        cell.imageView?.image = UIImage(named: "flag")
        
        return cell
    }
}
