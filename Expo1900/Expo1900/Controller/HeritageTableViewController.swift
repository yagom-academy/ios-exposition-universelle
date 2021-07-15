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
    private let jsonDecoder = JsonDecoder()
    private var informationOfKoreanHeritages: [InformationOfKoreanHeritage] = []
    private let detailHeritageViewControllerIdentifier = "ThirdVC"
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchKoreanHeritageInfo()
    }
    
    //MARK: - Method
    private func fetchKoreanHeritageInfo() {
        guard let value = try? jsonDecoder.decode(name: "items", type: [InformationOfKoreanHeritage].self) else {
            return
        }
        informationOfKoreanHeritages = value
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informationOfKoreanHeritages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: HeritageTableViewCell = tableView.dequeueReusableCell(withIdentifier: HeritageTableViewCell.identifier, for: indexPath) as? HeritageTableViewCell else {
            return UITableViewCell()
        }
        let koreanHeritage: InformationOfKoreanHeritage = self.informationOfKoreanHeritages[indexPath.row]
        cell.configure(koreanHeritage: koreanHeritage)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let convertDetailHeritageViewController: DetailHeritageViewController = self.storyboard?.instantiateViewController(identifier: self.detailHeritageViewControllerIdentifier) as? DetailHeritageViewController else {
            return
        }
        convertDetailHeritageViewController.configure(koreanHeritage: informationOfKoreanHeritages[indexPath.row])
        self.navigationController?.pushViewController(convertDetailHeritageViewController, animated: true)
    }
}
