//
//  ExpoMenuViewController.swift
//  Expo1900
//
//  Created by 유한석 on 2022/06/17.
//

import UIKit

class ExpoMenuViewController: UIViewController {
    var expoItemList: [ExpoItemElement] = []
    
    @IBOutlet weak var expoItemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expoItemTableView.delegate = self
        expoItemTableView.dataSource = self
        setExpositionData()
    }
    
    private func setExpositionData() {
        let expoItemList = loadJsonData(type: Array<ExpoItemElement>.self, "items", "json")
        self.expoItemList = expoItemList
    }
}

extension ExpoMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ExpoMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expoItemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //셀을 반환해야함 > 어떤셀? 우리가 만든 셀
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpoMenuTableViewCell") as? ExpoMenuTableViewCell else {
            return UITableViewCell()
        }
        let currentExpoItemElement = expoItemList[indexPath.row]
        cell.settingLableView(name: currentExpoItemElement.name, shortDescription: currentExpoItemElement.shortDesc)
        cell.settingImageView(name: currentExpoItemElement.imageName)
        return cell
    }
}
