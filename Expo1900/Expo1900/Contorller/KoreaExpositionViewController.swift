//
//  KoreaExpositionViewController.swift
//  Expo1900
//
//  Created by 김준건 on 2021/07/07.
//

import UIKit

class KoreaExpositionViewController: UIViewController {
    
    
    //직지, 거문고, 가야금, 훈민정음
    
    @IBOutlet weak var koreaExpositionTableView: UITableView!
    var koreaExpositions: [KoreaExposition] = []
    let tableViewCellIdentifer = "KoreaExpositionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodingKoreaExpositionData()
        koreaExpositionTableView.dataSource = self
    }
    
    func decodingKoreaExpositionData() {
        let decoder = JSONDecoder()
        if let dataAsset = NSDataAsset.init(name: "items") {
            do {
                koreaExpositions = try decoder.decode([KoreaExposition].self, from: dataAsset.data)
            } catch {
                print("Decoding Error")
            }
        }
    }
}

extension KoreaExpositionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaExpositions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifer, for: indexPath)

        guard let customCell = cell as? KoreaExpositionCustomCell else {
            return cell
        }
        
        let test = koreaExpositions[indexPath.row]

        return customCell
    }
}
