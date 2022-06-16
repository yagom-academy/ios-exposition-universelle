//
//  KoreanEntryTableViewController.swift
//  Expo1900
//
//  Created by Kay on 2022/06/17.
//

import UIKit

class KoreanEntryTableViewContoller: UITableViewController {
    var entries: [ExpositionEntry]?
}

// MARK: - 뷰 라이프사이클 메서드
extension KoreanEntryTableViewContoller {
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData()
    }
}

// MARK: - 테이블 뷰 관련 메서드
extension KoreanEntryTableViewContoller {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "koreanEntryCell", for: indexPath)

        return cell
    }
}
