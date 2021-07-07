//
//  KoreaExpositionViewController.swift
//  Expo1900
//
//  Created by 김준건 on 2021/07/07.
//

import UIKit

class KoreaExpositionViewController: UIViewController {

    @IBOutlet weak var koreaExpositionTableView: UITableView!
    var koreaExpositions: [KoreaExposition] = []
    let tableViewCellIdentifer = "KoreaExpositionCell"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        decodingKoreaExpositionData()
        koreaExpositionTableView.dataSource = self
        // Do any additional setup after loading the view.
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
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
