//
//  KoreaWorksViewController.swift
//  Expo1900
//
//  Created by sole on 2020/12/23.
//

import UIKit

class KoreaWorksViewController: UIViewController {
    
    private var koreaWorksList: [KoreaWorks] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeKoreaWorks()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDetail" else {
            return
        }
        guard let destinationController = segue.destination as? KoreaWorksDetailViewController,
              let index = sender as? Int else {
            return
        }
        let koreaWorksInfo = koreaWorksList[index]
        destinationController.koreaWorksInfo = koreaWorksInfo
    }
}

extension KoreaWorksViewController {
    
    private func decodeKoreaWorks() {
        
        let jsonDecoder = JSONDecoder()
        guard let assetData: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        guard let koreaWorksData = try? jsonDecoder.decode([KoreaWorks].self, from: assetData.data) else {
            return
        }
        koreaWorksList = koreaWorksData
    }
}

extension KoreaWorksViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension KoreaWorksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaWorksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let koreaWorksInfo = koreaWorksList[indexPath.row]
        cell.updateCell(info: koreaWorksInfo)
        return cell
    }
}
