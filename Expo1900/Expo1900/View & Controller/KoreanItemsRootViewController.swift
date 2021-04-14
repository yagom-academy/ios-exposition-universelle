//
//  KoreaItemsViewController.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/11.
//

import UIKit

final class KoreanItemsRootViewController: UIViewController {
    private let koreanItems: [KoreanItem] = {
        var items = [KoreanItem]()
        if let dataAsset = NSDataAsset(name: "items") {
            do {
                items =  try JSONDecoder().decode([KoreanItem].self, from: dataAsset.data)
            } catch {
                items = [KoreanItem]()
            }
        }
        return items
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(KoreanItemCell.self, forCellReuseIdentifier: KoreanItemCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "한국의 출품작"
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .white
        view.addSubview(tableView)
        setConstraint()
    }
    
    private func setConstraint() {
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let koreanItemViewcontroller = KoreanItemViewController()
        koreanItemViewcontroller.koreanItem = koreanItems[indexPath.row]
        navigationController?.pushViewController(koreanItemViewcontroller, animated: true)
    }
}

extension KoreanItemsRootViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        koreanItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KoreanItemCell.reuseIdentifier, for: indexPath) as? KoreanItemCell else {
            return UITableViewCell()
        }
        let koreanItemData = koreanItems[indexPath.row]
        cell.itemImageView.image = UIImage(named: koreanItemData.imageName)
        cell.titleLabel.text = koreanItemData.name
        cell.shortDescriptionLabel.text = koreanItemData.shortDescription
        return cell
    }
}
