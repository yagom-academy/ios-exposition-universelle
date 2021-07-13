//
//  ExpositionListViewController.swift
//  Expo1900
//
//  Created by Do Yi Lee on 2021/07/08.
//

import UIKit

class ExpositionListViewController: UIViewController {
    @IBOutlet private var expositionTableView: UITableView!
    
    private let cellReuseIdentifier = "ExpositionListCell"
    var expositionItems: [ExpositionItem]?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewSegue",
           let detailView = segue.destination as? ExpositionDetailViewController,
           let cell = sender as? UITableViewCell,
           let indexPath = expositionTableView.indexPath(for: cell),
           let expositionItem = expositionItems?[indexPath.row]
        {
            detailView.configure(expositionItem: expositionItem)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expositionTableView.delegate = self
        expositionTableView.dataSource = self
        expositionItems = try? JSONParser.parse(name: "items", type: [ExpositionItem].self).get()
    }
}

extension ExpositionListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? ExpositionListCell,
              let expositionItem = expositionItems?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configure(expositionItem: expositionItem)
        return cell
    }
}
