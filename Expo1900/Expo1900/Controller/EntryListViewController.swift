//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/17.
//

import UIKit

class EntryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var entryList: [EntryList]?
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self,
                           forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = ExpoNameSpace.koreaEntry.name
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(tableView)
        self.fetchEntryList()
        self.setTableView()
        
        updateUI()
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        guard let entryList = entryList else { return 0 }
        
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let descriptionViewController = DescriptionViewController()
        
        descriptionViewController.entryList = entryList?[indexPath.row]
        self.navigationController?.pushViewController(descriptionViewController,
                                                      animated: true)
        self.tableView.deselectRow(at: indexPath,
                                   animated: true)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpoNameSpace.cellIdentifier.name,
                                                       for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
                
        tableView.addSubview(cell)
        cell.addSubviews()
        cell.setConstraints()
        updateCell(cell: cell,
                   indexPath)
        return cell
    }
    
    func setTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    private func fetchEntryList() {
        guard let entryList = JSONParser.fetch(fileName: ExpoNameSpace.koreaEntryJSONFileName.name,
                                               parsedItems: entryList) else { return }
        
        self.entryList = entryList
    }
}
