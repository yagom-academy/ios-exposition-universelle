//  ExhibitViewController.swift
//  Expo1900
//  Created by inho, LJ  on 2022/10/21.

import UIKit

class ExhibitViewController: UIViewController {
    @IBOutlet weak var exhibitTableView: UITableView!
    let cellIdentifier: String = "exhibitCell"
    var exhibits: [ExhibitData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        exhibitTableView.delegate = self
        exhibitTableView.dataSource = self
        navigationItem.title = "한국의 출품작"
        
        guard let exhibitData = JSONDecoder.parse(assetName: "items", to: [ExhibitData].self) else {
            return
        }
        
        exhibits = exhibitData
    }
}

extension ExhibitViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ExhibitTableViewCell = exhibitTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExhibitTableViewCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "잘못된 셀"
            
            return cell
        }
        
        let exhibit: ExhibitData = exhibits[indexPath.row]
        
        cell.exhibitNameLabel.text = exhibit.name
        cell.exhibitShortDescriptionLabel.text = exhibit.shortDescription
        cell.exhibitImageView.image = exhibit.image
        
        return cell
    }
}

extension ExhibitViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextViewController: ExhibitDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "exhibitDetailViewController") as? ExhibitDetailViewController else {
            return
        }
        
        nextViewController.exhibitData = exhibits[indexPath.row]
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
