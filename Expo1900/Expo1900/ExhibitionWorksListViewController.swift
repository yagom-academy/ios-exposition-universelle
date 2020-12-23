//
//  ExhibitionWorksListViewController.swift
//  Expo1900
//
//  Created by 강인희 on 2020/12/22.
//

import UIKit

class ExhibitionWorksListViewController: UIViewController {
    @IBOutlet weak var workListTableView: UITableView!

    var tempArray = [1,2,3,4,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }
}
extension ExhibitionWorksListViewController: UITableViewDelegate {
    
}
extension ExhibitionWorksListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tempArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            fatalError("error발생")
        }
        cell.textLabel?.text = "hi"
        return cell
    }
}
