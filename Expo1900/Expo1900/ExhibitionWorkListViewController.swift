//
//  ExhibitionWorkListViewController.swift
//  Expo1900
//
//  Created by Som, Stone, Aaron on 2022/10/20.
//

import UIKit

class ExhibitionWorkListViewController: UIViewController {
    @IBOutlet weak var exhibitionWorkTableView: UITableView!
    
    let cellIdentifier: String = "cell"
    var exhibitionWork: [ExhibitionWork] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpJSONData()
        exhibitionWorkTableView.dataSource = self
        exhibitionWorkTableView.delegate = self
    }
    
    func setUpJSONData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            exhibitionWork = try jsonDecoder.decode([ExhibitionWork].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        self.exhibitionWorkTableView.reloadData()
    }
}

extension ExhibitionWorkListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitionWork.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = exhibitionWorkTableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let work: ExhibitionWork = self.exhibitionWork[indexPath.row]
        
        cell.textLabel?.text = work.name
        cell.detailTextLabel?.text = work.shortDesc
        cell.imageView?.image = UIImage(named: work.imageName)
        
        return cell
    }
}

extension ExhibitionWorkListViewController: UITableViewDelegate {
    
}

