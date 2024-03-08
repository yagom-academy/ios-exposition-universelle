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
    
    // 섹션에 해당하는 row 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreanHeritage.count
    }
    
    // row마다 해당하는 cell 반환하기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: KoreanHeritageTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! KoreanHeritageTableViewCell
        
//        cell.titleLabel?.text = koreanHeritage[indexPath.row]
//        print(koreanHeritage)
        return cell
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
