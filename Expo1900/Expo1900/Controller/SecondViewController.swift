//
//  SecondViewController.swift
//  Expo1900
//
//  Created by 오승기 on 2021/07/08.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var informationOfKoreanHeritages: [InformationOfKoreanHeritage] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        do {
            self.informationOfKoreanHeritages = try jsonDecoder.decode([InformationOfKoreanHeritage].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informationOfKoreanHeritages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let koreanHeritage = informationOfKoreanHeritages[indexPath.row]
        cell.koreanHeritageImage.image = UIImage(named: koreanHeritage.imageName)
        cell.koreanHeritageTitle.text = koreanHeritage.name
        cell.koreanHeritageShortDescription.text = koreanHeritage.shortDescription
        
        return cell
    }
}
