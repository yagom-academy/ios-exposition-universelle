//
//  ExpositionListViewController.swift
//  Expo1900
//
//  Created by goat, vetto on 2023/02/22.
//

import UIKit

final class ExpositionListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    private var fetchedExpositions: [ExpositionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchExpositionList()
        
        listTableView.delegate = self
        listTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func fetchExpositionList() {
        fetchedExpositions = ExpositionParser.expositionItemParse()
    }
    
    private func setupListCell(listCell: ListTableViewCell, indexPath: IndexPath) {
        
        let fetchedExpositionsRow = fetchedExpositions[indexPath.row]
        
        listCell.mainTitleLabel.text = fetchedExpositionsRow.name
        listCell.shortDescriptionLabel.text = fetchedExpositionsRow.shortDescription
        listCell.expositionImageView.image = UIImage(named: fetchedExpositionsRow.imageName)
    }
    
    private func setupDetailViewController(detailViewController: DetailViewController, indexPath: IndexPath) {
        
        let fetchedExpositionsRow = fetchedExpositions[indexPath.row]
        
        detailViewController.imageString = fetchedExpositionsRow.imageName
        detailViewController.fullDescription = fetchedExpositionsRow.description
        detailViewController.navigationItem.title = fetchedExpositionsRow.name
    }
}

extension ExpositionListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listTableView.deselectRow(at: indexPath, animated: true)
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: Identifier.detailViewController) as? DetailViewController else { return }
        
        setupDetailViewController(detailViewController: detailVC, indexPath: indexPath)
        
        let backBarButtonItem = UIBarButtonItem(title: Title.itemsOfKorea, style: .plain, target: DetailViewController.self, action: nil)
        
        self.navigationItem.backBarButtonItem = backBarButtonItem
        self.navigationController?.pushViewController(detailVC , animated: true)
    }
}

extension ExpositionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedExpositions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listCell: ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: Identifier.listTableViewCell, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        setupListCell(listCell: listCell, indexPath: indexPath)
        return listCell
    }
}
