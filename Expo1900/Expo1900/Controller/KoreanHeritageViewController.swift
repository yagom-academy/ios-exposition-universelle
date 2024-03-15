//
//  KoreanHeritageViewController.swift
//  Expo1900
//
//  Created by Danny, Gray 3/14/24.
//

import UIKit

class KoreanHeritageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    private var koreanHeritageTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let cellIdentifier: String = "HeritageTableViewCell"
    private var koreanHeritage: [KoreanHeritage]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreanHeritage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HeritageTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! HeritageTableViewCell
        
        cell.useTitleLabel(titleLabelText: koreanHeritage[indexPath.row].name)
        cell.useShortDescriptionLabel(shortDescriptionText: koreanHeritage[indexPath.row].shortDescription)
        cell.useitemImageView(itemImageName: koreanHeritage[indexPath.row].imageName)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let koreanHeritageDetailViewController = KoreanHeritageDetailViewController()
        
        koreanHeritageDetailViewController.setItemInformation(
            title: koreanHeritage[indexPath.row].name,
            imageName: koreanHeritage[indexPath.row].imageName,
            description: koreanHeritage[indexPath.row].description
        )
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(koreanHeritageDetailViewController, animated: true)
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
        
        koreanHeritageTableView.register(HeritageTableViewCell.self,forCellReuseIdentifier: cellIdentifier)
        addSubview()
        koreanHeritageTableView.rowHeight = UITableView.automaticDimension
        koreanHeritageTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    private func addSubview() {
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
