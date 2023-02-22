//
//  ExhibitItemViewController.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/22.
//

import UIKit

final class ExhibitItemViewController: UIViewController {
    
    // MARK: -  Property
    private var exhibitItems: [ExhibitItem]? = {
        let decoder = Decoder()
        return decoder.decodeExhibitItem()
    }()
    
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
        tableView.register(UINib(nibName: "ExhibitItemCell", bundle: nil), forCellReuseIdentifier: "ExhibitItemCell")
        
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
        guard let rowCount = exhibitItems?.count else { return 0 }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ExhibitItemCell = tableView.dequeueReusableCell(withIdentifier: ExhibitItemCell.reuseIdentifier, for: indexPath) as! ExhibitItemCell
        
        let imageName = exhibitItems?[0].imageName
        let title = exhibitItems?[0].name
        let subTitle = exhibitItems?[0].shortDescription
        
        cell.setProperty(imageName: imageName, title: title, subTitle: subTitle)
        
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
