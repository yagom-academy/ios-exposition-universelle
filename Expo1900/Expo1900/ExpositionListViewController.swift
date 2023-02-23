//
//  ExpositionListViewController.swift
//  Expo1900
//
//  Created by goat, vetto on 2023/02/22.
//

import UIKit

class ExpositionListViewController: UIViewController {
    var expositionList: [ExpositionItem] = []
    
    @IBOutlet weak var listTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "한국의 출품작"
        
        let jsonDecoder = JSONDecoder()
        
        guard let jsonData: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            expositionList = try jsonDecoder.decode([ExpositionItem].self, from: jsonData.data)
        } catch {
            return
        }
        print(expositionList)
        listTableView.delegate = self
        listTableView.dataSource = self
        
    
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension ExpositionListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listTableView.deselectRow(at: indexPath, animated: true)
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        detailVC.imageString = expositionList[indexPath.row].imageName
        detailVC.fullDescription = expositionList[indexPath.row].description
        detailVC.navigationItem.title = expositionList[indexPath.row].name
        let backBarButtonItem = UIBarButtonItem(title: "한국의 출품작", style: .plain, target: DetailViewController.self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        self.navigationController?.pushViewController(detailVC , animated: true)
    }
}

extension ExpositionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let listCell: ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        
        listCell.mainTitle.text = expositionList[indexPath.row].name
        listCell.shortDescription.text = expositionList[indexPath.row].shortDescription
        listCell.expositionImage.image = UIImage(named: expositionList[indexPath.row].imageName)
        return listCell
    }
    
}
