//
//  ExpositionListViewController.swift
//  Expo1900
//
//  Created by Do Yi Lee on 2021/07/08.
//

import UIKit

class ExpositionListViewController: UIViewController {
	private let cellReuseIdentifier = "ExpositionListCell"
	
	@IBOutlet var expositionTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		expositionTableView.delegate = self
		expositionTableView.dataSource = self
	}
}

extension ExpositionListViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? ExpositionListCell else {
			return UITableViewCell()
		}
		return cell
	}
}
