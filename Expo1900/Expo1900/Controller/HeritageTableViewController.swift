//
//  SecondViewController.swift
//  Expo1900
//
//  Created by 오승기 on 2021/07/08.
//

import UIKit

class HeritageTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - IBOulet
    @IBOutlet weak private var tableView: UITableView!
    
    //MARK: - Property
    private var informationOfKoreanHeritages: [InformationOfKoreanHeritage] = []
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        decodingJson()
    }
    
    //MARK: - Method
    private func decodingJson() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            self.informationOfKoreanHeritages = try jsonDecoder.decode([InformationOfKoreanHeritage].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informationOfKoreanHeritages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let koreanHeritage: InformationOfKoreanHeritage = self.informationOfKoreanHeritages[indexPath.row]
        cell.koreanHeritageImage.image = UIImage(named: koreanHeritage.imageName)
        cell.koreanHeritageTitle.text = koreanHeritage.name
        cell.koreanHeritageShortDescription.text = koreanHeritage.shortDescription
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextVC: DetailHeritageViewController = self.storyboard?.instantiateViewController(identifier: "ThirdVC") as? DetailHeritageViewController else {
            return
        }
        nextVC.koreanHeritage = informationOfKoreanHeritages[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
