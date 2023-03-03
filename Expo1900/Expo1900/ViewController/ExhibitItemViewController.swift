//
//  ExhibitItemViewController.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/22.
//

import UIKit

final class ExhibitItemViewController: UIViewController {
    
    // MARK: -  Property
    private let tableView = UITableView()
    
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // MARK: - View State Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitialView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        appDelegate?.shouldSupportAllOrientation = true
    }
    
    // MARK: - Instance Method
    private func setInitialView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        view.backgroundColor = .white
        self.title = "한국의 출품작"
        view.addSubview(tableView)
        
        setTableView()
    }
    
    func setTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
        tableView.setAutoLayout(equalTo: view, isNeededWidthAnchor: false)
    }
}

// MARK: - Extension TableView
extension ExhibitItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = ExhibitItem.items?.count else { return 0 }
        
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath)
        
        cell.setCellContents(indexPath)
        
        return cell
    }
}

extension ExhibitItemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let exhibitItem = ExhibitItem.items?[indexPath.row]
        let itemDescriptionView = ItemDescriptionViewController(exhibitItem)
        
        self.navigationController?.pushViewController(itemDescriptionView, animated: true)
    }
}
