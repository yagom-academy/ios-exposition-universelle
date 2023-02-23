//
//  ExhibitItemViewController.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/22.
//

import UIKit

final class ExhibitItemViewController: UIViewController {
    
    // MARK: -  Property
    private let tableView = UITableView()
    
    // MARK: - View State Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        initializeView()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Instance Method
    
    private func initializeView() {
        view.backgroundColor = .white
        self.title = "한국의 출품작"
        view.addSubview(tableView)
    }
    
    func setTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
}


// MARK: - Extension TableView
extension ExhibitItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = ExhibitItem.items?.count else { return 0 }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath)
        
        cell.setCellContents(indexPath)
        
        return cell
    }
    
    
}

extension ExhibitItemViewController: UITableViewDelegate {
    
}


// MARK: - Canvas
import SwiftUI
struct ExhibitItemViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ExhibitItemViewController
    
    func makeUIViewController(context: Context) -> ExhibitItemViewController {
            return ExhibitItemViewController()
        }

    func updateUIViewController(_ uiViewController: ExhibitItemViewController, context: Context) {
    }
}
@available(iOS 13.0.0, *)
struct ExhibitItemViewPreview: PreviewProvider {
    static var previews: some View {
        ExhibitItemViewControllerRepresentable()
    }
}
