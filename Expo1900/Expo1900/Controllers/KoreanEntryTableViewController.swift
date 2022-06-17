//
//  KoreanEntryTableViewController.swift
//  Expo1900
//
//  Created by Kay on 2022/06/17.
//

import UIKit

class KoreanEntryTableViewController: UITableViewController {
    var entries: [ExpositionEntry]?
    var posterViewController: UIViewController?
}

// MARK: - 뷰 라이프사이클 메서드
extension KoreanEntryTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// MARK: - 테이블 뷰 관련 메서드
extension KoreanEntryTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "koreanEntryCell", for: indexPath)
        
        guard let entryCell = cell as? KoreanEntryTableViewCell else {
            return cell
        }
        
        let data = entries?[indexPath.row]
        
        entryCell.entryImageView.image = data?.thumbnail
        entryCell.titleLabel.text = data?.name
        entryCell.shortDescriptionLabel.text = data?.shortDescription
        
        return entryCell
    }
}

extension KoreanEntryTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedEntryViewController = self.storyboard?.instantiateViewController(withIdentifier: "SelectedEntryVC") as? SelectedEntryViewController else { return }
        selectedEntryViewController.entry = entries?[indexPath.row]
        self.navigationController?.pushViewController(selectedEntryViewController, animated: true)
    }
}
