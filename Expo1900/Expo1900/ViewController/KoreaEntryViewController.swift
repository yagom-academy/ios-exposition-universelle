//
//  KoreaEntryViewController.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/28.
//

import UIKit

protocol KoreaEntryViewControllerDelegate: AnyObject {
    func didSelectedKoreaEntryTableView(_ expositionItem: ExpositionItem)
}

final class KoreaEntryViewController: UIViewController {
    weak var delegate: KoreaEntryViewControllerDelegate?
    private var koreaEntryItems: [ExpositionItem]
    private lazy var dataSource = KoreaEntryDataSource(koreaEntyList: koreaEntryItems)
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.register(KoreaEntryTableViewCell.self, forCellReuseIdentifier: KoreaEntryTableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(koreaEntryItems: [ExpositionItem]) {
        self.koreaEntryItems = koreaEntryItems
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor(.systemBackground)
        configureUI()
        setUpTableViewConstraints()
    }
    
    private func configureUI() {
        view.addSubview(tableView)
    }
    
    private func setUpTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

// MARK: - TableView Delegate
extension KoreaEntryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let entryInformation = koreaEntryItems[safe: indexPath.row] else { return }
        
        delegate?.didSelectedKoreaEntryTableView(entryInformation)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
