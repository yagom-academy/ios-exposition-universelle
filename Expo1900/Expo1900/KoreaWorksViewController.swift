//
//  KoreaWorksViewController.swift
//  Expo1900
//
//  Created by sole on 2020/12/23.
//

import UIKit

class KoreaWorksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var koreaWorksList: [KoreaWorks] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaWorksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let koreaWorksInfo = koreaWorksList[indexPath.row]
        cell.updatdCell(info: koreaWorksInfo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let a = segue.destination as? KoreaWorksDetailViewController
            if let index = sender as? Int {
                let koreaWorksInfo = koreaWorksList[index]
                a?.koreaWorksInfo = koreaWorksInfo
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        decodeKoreaWorks()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    func updatdCell(info: KoreaWorks) {
        imgView.image = info.image
        nameLabel.text = info.name
        shortDescriptionLabel.text = info.shortDescription
    }
}

extension KoreaWorksViewController {
    
    private func decodeKoreaWorks() {
        
        let jasonDecoder = JSONDecoder()
        guard let assetData: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        guard let koreaWorksData = try? jasonDecoder.decode([KoreaWorks].self, from: assetData.data) else {
            return
        }
        koreaWorksList = koreaWorksData
    }
}

