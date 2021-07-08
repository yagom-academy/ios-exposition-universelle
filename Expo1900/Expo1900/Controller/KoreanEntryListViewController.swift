//
//  KoreanEntryListViewController.swift
//  Expo1900
//
//  Created by Jae-hoon Sim on 2021/07/08.
//

import UIKit

class KoreanEntryListViewController: UIViewController {

    @IBOutlet weak var entryTableView: UITableView!
    var entryList = [ExpoEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entryTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
}

extension KoreanEntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KoreanEntryListCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(systemName: "star")
        content.text = "asdasd"
        content.secondaryText = "ssdddsssddd"
        cell.contentConfiguration = content
        return cell
    }
}
