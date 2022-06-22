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
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "한국의 출품작"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(tableView)
        setTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let entryList = entryList else { return 0 }

        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return }
        let descriptionViewController = DescriptionViewController()
        self.navigationController?.pushViewController(descriptionViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cell.koreaEntryImage.image = UIImage(named: entryList?[indexPath.row].imageName ?? "")
        cell.koreaEntryTitle.text = entryList?[indexPath.row].name
        cell.shortDescription.text = entryList?[indexPath.row].shortDescription
        tableView.addSubview(cell)
        cell.addSubviews()
        cell.setKoreaEntryImageConstraints()
        cell.setKoreaEntryTitleConstraints()
        cell.setShortDescriptionConstraints()
//        cell.setCellConstraints()
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
}
