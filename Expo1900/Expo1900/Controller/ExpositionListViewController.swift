//
//  ExpositionListViewController.swift
//  Expo1900
//
//  Created by goat, vetto on 2023/02/22.
//

import UIKit

final class ExpositionListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    private var expositionItems: [ExpositionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchExpositionList()
        
        listTableView.delegate = self
        listTableView.dataSource = self
        setupNavigationTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func fetchExpositionList() {
        expositionItems = ExpositionParser.expositionItemParse()
    }
    
    private func setupListCell(listCell: ListTableViewCell, indexPath: IndexPath) {
        
        let fetchedExposition = expositionItems[indexPath.row]
        
        listCell.mainTitleLabel.text = fetchedExposition.name
        listCell.shortDescriptionLabel.text = fetchedExposition.shortDescription
        listCell.expositionImageView.image = UIImage(named: fetchedExposition.imageName)
    }
    
    private func setupDetailViewController(detailViewController: DetailViewController, indexPath: IndexPath) {
        
        let fetchedExposition = expositionItems[indexPath.row]
        
        detailViewController.imageString = fetchedExposition.imageName
        detailViewController.fullDescription = fetchedExposition.description
        detailViewController.navigationItem.title = fetchedExposition.name
    }
    
    private func setupNavigationTitle() {
        navigationItem.title = Title.itemsOfKorea
    }
}

extension ExpositionListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listTableView.deselectRow(at: indexPath, animated: true)
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: Identifier.detailViewController) as? DetailViewController else { return }
        
        setupDetailViewController(detailViewController: detailVC, indexPath: indexPath)
        
        self.navigationController?.pushViewController(detailVC , animated: true)
    }
}

extension ExpositionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listCell: ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: Identifier.listTableViewCell, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        setupListCell(listCell: listCell, indexPath: indexPath)
        return listCell
    }
}
