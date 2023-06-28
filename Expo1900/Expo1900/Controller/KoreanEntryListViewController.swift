//
//  KoreanEntryListViewController.swift
//  Expo1900
//
//  Created by Minsup, Jusbug on 2023/06/28.
//

import UIKit

class KoreanEntryListViewController: UIViewController {
    @IBOutlet weak private var entryTableView: UITableView!
    private var entryList: [Entry] = DecodingHandler.decode(fileName: .entry) ?? []
    static let identifier = "koreanEntryListViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.entryTableView.delegate = self
        self.entryTableView.dataSource = self
    }
}

extension KoreanEntryListViewController: UITableViewDelegate {

}

extension KoreanEntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
