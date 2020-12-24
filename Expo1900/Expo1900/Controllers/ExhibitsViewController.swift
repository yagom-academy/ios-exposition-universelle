//
//  ExhibisViewController.swift
//  Expo1900
//
//  Created by 김호준 on 2020/12/22.
//

import UIKit

class ExhibitsViewController: UIViewController {
    
    private lazy var exhibits: [Exhibit]? = {
        if let data = NSDataAsset(name: "items")?.data {
            do {
                let exhibits = try JSONDecoder().decode([Exhibit].self, from: data)
                return exhibits
            } catch {
                return nil
            }
        }
        return nil
    }()
    
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
        self.navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .systemBackground
        exhibitsTableView.delegate = self
        exhibitsTableView.dataSource = self
        view.addSubview(exhibitsTableView)
        setupConstraints()
    }
    
    //MARK: - Private
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(exhibitsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(exhibitsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(exhibitsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(exhibitsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        NSLayoutConstraint.activate(constraints)
    }
}

//MARK: - Extensions
extension ExhibitsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exhibits?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ExhibitsTableViewCell.reuseIdentifier,
                                                    for: indexPath) as? ExhibitsTableViewCell {
            cell.accessoryType = .disclosureIndicator
            cell.configureCell(with: exhibits?[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewcontroller = DetailViewController()
        detailViewcontroller.exhibit = exhibits?[indexPath.row]
        detailViewcontroller.title = exhibits?[indexPath.row].name
        navigationItem.backButtonTitle = "한국의 출품작"
        navigationController?.pushViewController(detailViewcontroller, animated: true)
    }
}
