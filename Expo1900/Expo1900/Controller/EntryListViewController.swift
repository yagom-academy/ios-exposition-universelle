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
        tableView.register(EntryListCell.self,
                           forCellReuseIdentifier: EntryListCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        self.fetchEntryList()
        self.setTableView()
        self.setTableViewConstraints()
        self.title = ExpoNameSpace.koreaEntry.name
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EntryListCell.identifier,
                                                       for: indexPath) as? EntryListCell else { return UITableViewCell() }
                
        cell.addSubviews()
        cell.setConstraints()
        updateCell(cell: cell,
                   indexPath)
        return cell
    }
    
    func setTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    //MARK: - fetchEntryList
    
    private func fetchEntryList() {
        guard let entryList = JSONParser.fetch(fileName: ExpoNameSpace.koreaEntryJSONFileName.name,
                                               parsedItems: entryList) else { return }
        
        self.entryList = entryList
    }
}
