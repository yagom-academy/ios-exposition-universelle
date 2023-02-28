//
//  ExpositionListViewController.swift
//  Expo1900
//
//  Created by goat, vetto on 2023/02/22.
//

import UIKit

final class ExpositionListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    private var parsedExpositionData: [ExpositionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchParsedData()
        
        listTableView.delegate = self
        listTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func fetchParsedData() {
        parsedExpositionData = ExpositionParser.expositionItemParse()
    }
    
    private func setupListCell(listCell: ListTableViewCell, indexPath: IndexPath) {
        listCell.mainTitleLabel.text = parsedExpositionData[indexPath.row].name
        listCell.shortDescriptionLabel.text = parsedExpositionData[indexPath.row].shortDescription
        listCell.expositionImageView.image = UIImage(named: parsedExpositionData[indexPath.row].imageName)
    }
    
    private func setupDetailViewController(detailViewController: DetailViewController, indexPath: IndexPath) {
        detailViewController.imageString = parsedExpositionData[indexPath.row].imageName
        detailViewController.fullDescription = parsedExpositionData[indexPath.row].description
        detailViewController.navigationItem.title = parsedExpositionData[indexPath.row].name
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
        return parsedExpositionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listCell: ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: Identifier.listTableViewCell, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        setupListCell(listCell: listCell, indexPath: indexPath)
        return listCell
    }
}
