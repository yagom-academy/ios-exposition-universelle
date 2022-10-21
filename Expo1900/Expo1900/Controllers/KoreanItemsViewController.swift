//
//  KoreanItemsViewController.swift
//  Expo1900
//
//  Created by Rhovin, Aejong on 2022/10/21.
//

import UIKit

class KoreanItemsViewController: UIViewController {
    @IBOutlet private weak var koreanItemsTableView: UITableView!
    private let cellIdentifier: String = "itemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.koreanItemsTableView.delegate = self
        self.koreanItemsTableView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension KoreanItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension KoreanItemsViewController: UITableViewDelegate {
    
}
