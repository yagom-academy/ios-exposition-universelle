//
//  ExpositionListViewController.swift
//  Expo1900
//
//  Created by goat, vetto on 2023/02/22.
//

import UIKit

final class ExpositionListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    private var expositionList: [ExpositionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchExpositionData()

        listTableView.delegate = self
        listTableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func fetchExpositionData() {
        let jsonDecoder = JSONDecoder()
        guard let jsonData: NSDataAsset = NSDataAsset(name: JsonFile.items) else { return }
        
        do {
            expositionList = try jsonDecoder.decode([ExpositionItem].self, from: jsonData.data)
        } catch {
            return
        }
    }
    
    private func setupListCell(listCell: ListTableViewCell, indexPath: IndexPath) {
        listCell.mainTitle.text = expositionList[indexPath.row].name
        listCell.shortDescription.text = expositionList[indexPath.row].shortDescription
        listCell.expositionImage.image = UIImage(named: expositionList[indexPath.row].imageName)
    }
    
    private func setupDetailViewController(detailViewController: DetailViewController, indexPath: IndexPath) {
        detailViewController.imageString = expositionList[indexPath.row].imageName
        detailViewController.fullDescription = expositionList[indexPath.row].description
        detailViewController.navigationItem.title = expositionList[indexPath.row].name
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
        return expositionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listCell: ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: Identifier.listTableViewCell, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        setupListCell(listCell: listCell, indexPath: indexPath)
        return listCell
    }
}
