//
//  KoreanEntryTableViewController.swift
//  Expo1900
//
//  Created by Kay on 2022/06/17.
//

import UIKit

// TODO: 고정된 값을 가진 String 값들을 담아 주는 네임스페이스 생성

class KoreanEntryTableViewController: UITableViewController {
    var entries: [ExpositionEntry]?
}

extension KoreanEntryTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension KoreanEntryTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "koreanEntryCell", for: indexPath) as? KoreanEntryTableViewCell else { return UITableViewCell() }
        let data = entries?[indexPath.row]
        
        cell.entryImageView.image = data?.thumbnail
        cell.titleLabel.text = data?.name
        cell.shortDescriptionLabel.text = data?.shortDescription
        
        return cell
    }
}

extension KoreanEntryTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedEntryViewController = self.storyboard?.instantiateViewController(withIdentifier: "SelectedEntryVC") as? SelectedEntryViewController else { return }
        selectedEntryViewController.entry = entries?[indexPath.row]
        self.navigationController?.pushViewController(selectedEntryViewController, animated: true)
    }
}
