//
//  ExhibitionWorkListViewController.swift
//  Expo1900
//
//  Created by Som, Stone, Aaron on 2022/10/20.
//

import UIKit

final class ExhibitionWorkListViewController: UIViewController {
    
    let exhibitionWorkTableView: UITableView = UITableView()
    
    var exhibitionWork: [ExhibitionWork] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpJSONData()
        exhibitionWorkTableView.dataSource = self
        exhibitionWorkTableView.delegate = self
    }
    
    
    
    func setUpJSONData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: ExpositionNameSpace.itemKeys) else { return }
        
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
        let cell = exhibitionWorkTableView.dequeueReusableCell(withIdentifier: TableViewCell.cellIdentifier, for: indexPath) as! TableViewCell
        let work: ExhibitionWork = self.exhibitionWork[indexPath.row]
        
        cell.titleLabel.text = work.name
        cell.detailLabel.text = work.shortDesc
        cell.workImageView.image = UIImage(named: work.imageName)
        
        return cell
    }
}

extension ExhibitionWorkListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailWorkVC = DetailWorkViewController()
        
        detailWorkVC.exhibitionWork = self.exhibitionWork[indexPath.row]
        
        self.navigationController?.pushViewController(detailWorkVC, animated: true)
    }
}

extension ExhibitionWorkListViewController {
    func setUpTableView() {
        self.exhibitionWorkTableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellIdentifier)
        self.view.addSubview(self.exhibitionWorkTableView)
        
        self.exhibitionWorkTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.exhibitionWorkTableView,
                                                   attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top,
                                                   multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.exhibitionWorkTableView,
                                                   attribute: .bottom, relatedBy: .equal, toItem: self.view,
                                                   attribute: .bottom, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.exhibitionWorkTableView,
                                                   attribute: .leading, relatedBy: .equal, toItem: self.view,
                                                   attribute: .leading, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.exhibitionWorkTableView,
                                                   attribute: .trailing, relatedBy: .equal, toItem: self.view,
                                                   attribute: .trailing, multiplier: 1.0, constant: 0))
    }
}
