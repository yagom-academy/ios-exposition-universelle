//
//  ExpoMenuViewController.swift
//  Expo1900
//
//  Created by 재재, 보리사랑 on 2022/06/17.
//

import UIKit

class ExpoMenuViewController: UIViewController {
    var expoItemList: [ExpoItemElement] = []
    
    @IBOutlet weak var expoItemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expoItemTableView.delegate = self
        expoItemTableView.dataSource = self
        setupExpositionData()
        modifyNavigationTitle(to: "한국의 출품작", in: self)
        modifyNavigationBackButtonTitle(to: "메인", in: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupExpositionData() {
        let expoItemList = loadJsonData(type: Array<ExpoItemElement>.self, "items", "json")
        self.expoItemList = expoItemList
    }
}

extension ExpoMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        detailVC.expoItemElement = expoItemList[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ExpoMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expoItemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpoMenuTableViewCell") as? ExpoMenuTableViewCell else {
            return UITableViewCell()
        }
        let currentExpoItemElement = expoItemList[indexPath.row]
        cell.setupLableView(name: currentExpoItemElement.name, shortDescription: currentExpoItemElement.shortDesc)
        cell.setupImageView(name: currentExpoItemElement.imageName)
        return cell
    }
}
