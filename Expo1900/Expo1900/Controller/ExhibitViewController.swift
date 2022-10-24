//  ExhibitViewController.swift
//  Expo1900
//  Created by inho, LJ  on 2022/10/21.

import UIKit

final class ExhibitViewController: UIViewController {
    @IBOutlet private weak var exhibitTableView: UITableView!
    private let cellIdentifier: String = ExpositionConstant.exhibitCell
    private var exhibits: [ExhibitData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        exhibitTableView.delegate = self
        exhibitTableView.dataSource = self
        navigationItem.title = ExpositionConstant.exhibitTitleText
        
        guard let exhibitData = JSONDecoder.parse(asset: ExpositionConstant.exhibitAssetName,
                                                  to: [ExhibitData].self)
        else {
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
        guard let cell: ExhibitTableViewCell =
                exhibitTableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                     for: indexPath) as? ExhibitTableViewCell
        else {
            let cell = UITableViewCell()
            cell.textLabel?.text = ExpositionConstant.cellErrorMessage
            
            return cell
        }
        
        let exhibit: ExhibitData = exhibits[indexPath.row]
        cell.configureCell(with: exhibit)
        
        return cell
    }
}

extension ExhibitViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextViewController: ExhibitDetailViewController =
                self.storyboard?.instantiateViewController(
                    withIdentifier: ExpositionConstant.exhibitDetailViewController)
                as? ExhibitDetailViewController
        else {
            return
        }
        
        nextViewController.fetchExhibitData(exhibits[indexPath.row])
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
