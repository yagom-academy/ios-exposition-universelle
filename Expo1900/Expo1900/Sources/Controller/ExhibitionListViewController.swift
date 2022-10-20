//
//  ExhibitionListViewController.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/20.
//

import UIKit

class ExhibitionListViewController: UIViewController {
    let cellIdentifier: String = "cell"
    var items: [Exhibition] = []
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            items = try jsonDecoder.decode([Exhibition].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func configureCells(_ item : Exhibition, cell: ExhibitionListTableViewCell) {
        cell.exhibitionImageView.image = UIImage(named: item.imageName)
        cell.shortDescriptionLabel.text = item.shortDescription
        cell.nameLabel.text = item.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let exhibitionViewController = segue.destination as? ExhibitionViewController else {
            return
        }
        guard let cell: ExhibitionListTableViewCell = sender as? ExhibitionListTableViewCell else {
            return
        }
        guard let text: String = cell.nameLabel.text else {
            return
        }
        
        exhibitionViewController.exhibition = exhibition(text)
    }
    
    func exhibition(_ name: String) -> Exhibition? {
        for item in items {
            if item.name == name {
                return item
            }
        }
        return nil
    }
}

extension ExhibitionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ExhibitionListTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExhibitionListTableViewCell else {
            return UITableViewCell()
        }
        let exhibitionItem: Exhibition = self.items[indexPath.row]
        configureCells(exhibitionItem, cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ExhibitionListViewController: UITableViewDelegate {
    
}
