//
//  KoreaItemsTableViewController.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/17.
//

import UIKit

final class KoreaItemTableViewController: UIViewController {
    //MARK: - KoreaItemTable Property
    
    private var koreaItems = [KoreaItem]()
    private weak var koreaItemSettableDelegate: KoreaItemSettable?
    
    //MARK: - KoreaItemTable View
    
    private let itemTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(KoreaItemTableViewCell.self, forCellReuseIdentifier: KoreaItemTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationItem()
        setKoreaView()
        setKoreaTableViewConstraint()
        setKoreaItems()
    }
    
    //MARK: - Setting View Methods
    
    private func setNavigationItem() {
        self.navigationItem.title = DetailSetUp.title
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func setKoreaView() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(itemTableView)
        self.itemTableView.dataSource = self
        self.itemTableView.delegate = self
    }
    
    private func setKoreaTableViewConstraint() {
        itemTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        itemTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        itemTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        itemTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    //MARK: - Setting Data Method
    
    private func setKoreaItems() {
        guard let items = NSDataAsset(name: Asset.KoreaItem),
              let decodedKoreaItems = try? JSONDecoder().decode([KoreaItem].self, from: items.data) else {
            return
        }
        self.koreaItems = decodedKoreaItems
    }
}

//MARK: - TableView DataSource, Delegate

extension KoreaItemTableViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KoreaItemTableViewCell.identifier, for: indexPath) as? KoreaItemTableViewCell else {
            return UITableViewCell()
        }
        cell.itemImageView.image = koreaItems[indexPath.row].image
        cell.titleLabel.text = koreaItems[indexPath.row].name
        cell.shortDescriptionLabel.text = koreaItems[indexPath.row].shortDescription
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    //MARK: Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemDetailViewController = KoreaItemDetailViewController()
        self.navigationController?.pushViewController(itemDetailViewController, animated: true)
        koreaItemSettableDelegate = itemDetailViewController
        koreaItemSettableDelegate?.setData(koreaItems[indexPath.row])
    }
    
}

//MARK: - NameSpace for Setting View Detail Option

extension KoreaItemTableViewController {
    private enum DetailSetUp {
        static let title = "한국의 출품작"
    }
}
