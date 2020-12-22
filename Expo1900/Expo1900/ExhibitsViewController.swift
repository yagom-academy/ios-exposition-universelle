//
//  ExhibisViewController.swift
//  Expo1900
//
//  Created by 김호준 on 2020/12/22.
//

import UIKit

class ExhibitsViewController: UIViewController {
    
    var exhibits: [Exhibit]?
    
    //MARK: - Views
    private let exhibitsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ExhibitsTableViewCell.self,
                           forCellReuseIdentifier: ExhibitsTableViewCell.reuseIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        getExhibitInformations()
        exhibitsTableView.delegate = self
        exhibitsTableView.dataSource = self
        view.addSubview(exhibitsTableView)
        setupConstraints()
    }
    
    //MARK: - Private
    private func getExhibitInformations() {
        if let data = NSDataAsset(name: "items")?.data {
            let decoder = JSONDecoder()
            do {
                let taskData = try decoder.decode([Exhibit].self, from: data)
                exhibits = taskData
            } catch let error {
                print(error)
            }
        }
    }
    
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(exhibitsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(exhibitsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(exhibitsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(exhibitsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        NSLayoutConstraint.activate(constraints)
    }
}

extension ExhibitsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exhibits?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ExhibitsTableViewCell.reuseIdentifier,
                                                    for: indexPath) as? ExhibitsTableViewCell {
            return cell
        }
        return UITableViewCell()
    }
}
