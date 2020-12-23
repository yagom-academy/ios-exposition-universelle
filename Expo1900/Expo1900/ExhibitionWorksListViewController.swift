//
//  ExhibitionWorksListViewController.swift
//  Expo1900
//
//  Created by 강인희 on 2020/12/22.
//

import UIKit

class ExhibitionWorksListViewController: UIViewController {

    private var exhibitionWorks = [ExhibitionWork]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.backItem?.title = "메인"
        self.navigationController?.navigationBar.topItem?.title = "한국의 출품작"
        
        decodeExhibitionData()
    }
    
    private func decodeExhibitionData() {
        let assetFile: String = "items"
        guard let asset = NSDataAsset(name: assetFile) else {
            fatalError("Can not found data asset.")
        }
        
        do {
            exhibitionWorks = try JSONDecoder().decode([ExhibitionWork].self, from: asset.data)
        } catch {
            print("error: \(error)")
        }
    }
}
extension ExhibitionWorksListViewController: UITableViewDelegate {
    
}
extension ExhibitionWorksListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
 
}
