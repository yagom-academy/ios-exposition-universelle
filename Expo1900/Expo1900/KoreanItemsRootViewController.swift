//
//  KoreaItemsViewController.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/11.
//

import UIKit

class KoreanItemsRootViewController: UIViewController {
    private var koreanItemsData = [KoreanItem]()
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
        getKoreanItemsData()
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = backButton
        view.addSubview(tableView)
        setConstraint()
    }
    
    func getKoreanItemsData() {
        guard let dataAsset = NSDataAsset(name: "items") else {
            return
        }
        do {
            koreanItemsData =  try JSONDecoder().decode([KoreanItem].self, from: dataAsset.data)
        } catch {
            return
        }
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
    @objc private func touchUpBackButton() {
        dismiss(animated: true, completion: nil)
    }
}

extension KoreanItemsRootViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        koreanItemsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KoreanItemCell.identifier, for: indexPath) as? KoreanItemCell else {
            return UITableViewCell()
        }
        let koreanItemData = koreanItemsData[indexPath.row]
        cell.itemImageView.image = UIImage(named: koreanItemData.imageName)
        cell.titleLabel.text = koreanItemData.name
        cell.shortDescriptionLabel.text = koreanItemData.shortDescription
        return cell
    }
}
