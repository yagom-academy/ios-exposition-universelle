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
    
}

extension ExpositionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let listCell: ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        
        listCell.maintitle.text = expositionList[indexPath.row].name
        listCell.shortDescription.text = expositionList[indexPath.row].shortDescription
        
        return listCell
    }
}
