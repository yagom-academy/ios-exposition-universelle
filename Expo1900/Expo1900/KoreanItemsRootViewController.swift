//
//  KoreaItemsViewController.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/11.
//

import UIKit

class KoreanItemsRootViewController: UIViewController {
    private lazy var backButton = UIBarButtonItem(title: "메인",
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(touchUpBackButton))
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(KoreanItemCell.self, forCellReuseIdentifier: KoreanItemCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = backButton // lazy로 선언하면 되고 그냥 var이나 let으로 하면 안되네?????
        view.addSubview(tableView)
        setConstraint()
    }
    
    @objc private func touchUpBackButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func setConstraint() {
        tableView.rowHeight = 100
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension KoreanItemsRootViewController: UITableViewDelegate {
    
}

extension KoreanItemsRootViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KoreanItemCell.identifier, for: indexPath) as? KoreanItemCell else {
            return UITableViewCell()
        }
        cell.itemImageView.image = UIImage(named: "flag")
        cell.titleLabel.text = "hello"
        cell.shortDescriptionLabel.text = "hi"
        return cell
    }
}
