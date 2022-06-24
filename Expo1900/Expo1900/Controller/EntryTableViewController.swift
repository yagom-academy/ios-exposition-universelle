//
//  EntryTableViewController.swift
//  Expo1900
//
//  Created by Derrick kim on 2022/06/15.
//

import UIKit

final class EntryTableViewController: UIViewController {
    private let entryTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var entryEntity: [EntryEntity]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.activateOnlyPortraitOrientation(false)
    }
}

// - MARK: TableView Settings

extension EntryTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let entryEntity = entryEntity {
            return entryEntity.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.entryTableView.dequeueReusableCell(withIdentifier: EntryTableViewCell.reuseIdentifier, for: indexPath) as? EntryTableViewCell else {
            return UITableViewCell()
        }
        cell.accessoryType = .disclosureIndicator
        
        if let data = entryEntity?[indexPath.row] {
            cell.configure(with: data)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        guard let data = entryEntity?[indexPath.row] else {
            return
        }
        let entryDetailViewController = EntryDetailViewController(data: data)
        self.navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}

// - MARK: View Settings

extension EntryTableViewController {
    private func configureUI() {
        entryTableView.delegate = self
        entryTableView.dataSource = self
        
        self.navigationController?.navigationBar.isHidden = false
        self.title = "한국의 출품작"
        view.backgroundColor = .white
        self.view.addSubview(entryTableView)
        
        entryTableView.insetsLayoutMarginsFromSafeArea = false
        entryTableView.contentInsetAdjustmentBehavior = .never
                
        entryTableView.register(EntryTableViewCell.self, forCellReuseIdentifier: EntryTableViewCell.reuseIdentifier)
        setConstraint()
        
        fetchData()
    }
    
    func setConstraint() {
        guard let safeArea = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.safeAreaInsets else {
            return
        }
        
        NSLayoutConstraint.activate([
            entryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            entryTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            entryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -max(20.0, safeArea.bottom)),
            entryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func fetchData() {
        guard let result = try? JsonParser<[EntryEntity]>.fetch(JSONFile.entryEntity.name) else {
            return
        }
        
        switch result {
        case .success(let data):
            entryEntity = data
        case .failure(let error):
            self.showConfirmAlert(title: "뒤로가기", message: error.message, alertStyle: .revert)
        }
    }
}
