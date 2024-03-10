//
//  KoreanHeritageViewController.swift
//  Expo1900
//
//  Created by Gray, Danny on 3/8/24.
//

import UIKit

class KoreanHeritageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var koreanHeritageTableView: UITableView!
    let cellIdentifier: String = "koreanHeritageCell"
    var koreanHeritage: [KoreanHeritage]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreanHeritage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: KoreanHeritageTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! KoreanHeritageTableViewCell
        
        cell.titleLabel?.text = koreanHeritage[indexPath.row].name
        cell.shortDescriptionTextView?.text = koreanHeritage[indexPath.row].shortDescription
        cell.itemImageView.image = UIImage(named: koreanHeritage[indexPath.row].imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "KoreanHeritageDetailViewController") as? KoreanHeritageDetailViewController else {
            return
        }
        
        detailViewController.title = koreanHeritage[indexPath.row].name
        detailViewController.itemImageName = koreanHeritage[indexPath.row].imageName
        detailViewController.itemDescription = koreanHeritage[indexPath.row].description
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.koreanHeritageTableView.delegate = self
        self.koreanHeritageTableView.dataSource = self
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            self.koreanHeritage = try jsonDecoder.decode([KoreanHeritage].self,  from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
