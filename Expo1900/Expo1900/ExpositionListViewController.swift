//
//  ExpositionListViewController.swift
//  Expo1900
//
//  Created by goat, vetto on 2023/02/22.
//

import UIKit

class ExpositionListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    private var expositionList: [ExpositionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJsonData()

        listTableView.delegate = self
        listTableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func getJsonData() {
        let jsonDecoder = JSONDecoder()
        guard let jsonData: NSDataAsset = NSDataAsset(name: JsonFile.items) else { return }
        
        do {
            expositionList = try jsonDecoder.decode([ExpositionItem].self, from: jsonData.data)
        } catch {
            return
        }
    }
}

extension ExpositionListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listTableView.deselectRow(at: indexPath, animated: true)
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: Identifier.detailViewController) as? DetailViewController else { return }
        
        detailVC.imageString = expositionList[indexPath.row].imageName
        detailVC.fullDescription = expositionList[indexPath.row].description
        detailVC.navigationItem.title = expositionList[indexPath.row].name
        
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
        
        let listCell: ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: Identifier.listTableViewCell, for: indexPath) as! ListTableViewCell
        
        listCell.mainTitle.text = expositionList[indexPath.row].name
        listCell.shortDescription.text = expositionList[indexPath.row].shortDescription
        listCell.expositionImage.image = UIImage(named: expositionList[indexPath.row].imageName)
        return listCell
    }
    
}
