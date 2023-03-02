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
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func fetchExpositionList() {
        fetchedExpositions = ExpositionParser.expositionItemParse()
    }
    
    private func setupListCell(listCell: ListTableViewCell, indexPath: IndexPath) {
        listCell.mainTitleLabel.text = fetchedExpositions[indexPath.row].name
        listCell.shortDescriptionLabel.text = fetchedExpositions[indexPath.row].shortDescription
        listCell.expositionImageView.image = UIImage(named: fetchedExpositions[indexPath.row].imageName)
    }
    
    private func setupDetailViewController(detailViewController: DetailViewController, indexPath: IndexPath) {
        detailViewController.imageString = fetchedExpositions[indexPath.row].imageName
        detailViewController.fullDescription = fetchedExpositions[indexPath.row].description
        detailViewController.navigationItem.title = fetchedExpositions[indexPath.row].name
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
