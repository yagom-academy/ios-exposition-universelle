//
//  SecondViewController.swift
//  Expo1900
//
//  Created by Danny, Gray 3/14/24.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    private var koreanHeritageTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let cellIdentifier: String = "HeritageViewCell"
    var koreanHeritage: [KoreanHeritage]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreanHeritage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HeritageViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! HeritageViewCell
        
        cell.titleLabel.text = koreanHeritage[indexPath.row].name
        cell.itemImageView.image = UIImage(named: koreanHeritage[indexPath.row].imageName)
        cell.shortDescriptionLabel.text = koreanHeritage[indexPath.row].shortDescription
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = ThirdViewController()
        
        tableView.deselectRow(at: indexPath, animated: true)
        detailViewController.itemImageName = koreanHeritage[indexPath.row].imageName
        detailViewController.itemDescription = koreanHeritage[indexPath.row].description
        
        detailViewController.title = koreanHeritage[indexPath.row].name
        
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        koreanHeritageTableView.delegate = self
        koreanHeritageTableView.dataSource = self
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            self.koreanHeritage = try jsonDecoder.decode([KoreanHeritage].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        koreanHeritageTableView.register(HeritageViewCell.self,forCellReuseIdentifier: cellIdentifier)
        addSubview()
        koreanHeritageTableView.rowHeight = UITableView.automaticDimension
        koreanHeritageTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    func addSubview() {
        self.view.addSubview(koreanHeritageTableView)
        
        setUpUIConstrants()
    }
    
    private func setUpUIConstrants() {
        NSLayoutConstraint.activate([
            koreanHeritageTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            koreanHeritageTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            koreanHeritageTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            koreanHeritageTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}
