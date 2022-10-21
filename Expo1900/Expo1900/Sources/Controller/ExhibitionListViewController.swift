//
//  ExhibitionListViewController.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/20.
//

import UIKit

class ExhibitionListViewController: UIViewController {
    private let cellIdentifier: String = "cell"
    private var itemsOfExposition: [Exhibition] = []
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            itemsOfExposition = try jsonDecoder.decode([Exhibition].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let exhibitionViewController = segue.destination as? ExhibitionViewController else {
            return
        }
        guard let cell = sender as? ExhibitionListTableViewCell else {
            return
        }
        guard let text = cell.nameLabel.text else {
            return
        }
        
        exhibitionViewController.exhibition = exhibition(named: text)
    }
    
    private func exhibition(named: String) -> Exhibition? {
        for item in itemsOfExposition {
            if item.name == named {
                return item
            }
        }
        return nil
    }
}

extension ExhibitionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsOfExposition.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: Exhibition = self.itemsOfExposition[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExhibitionListTableViewCell else {
            return UITableViewCell()
        }
        
        configureCells(item, cell: cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func configureCells(_ item : Exhibition, cell: ExhibitionListTableViewCell) {
        cell.exhibitionImageView.image = UIImage(named: item.imageName)
        cell.shortDescriptionLabel.text = item.shortDescription
        cell.nameLabel.text = item.name
    }
}

extension ExhibitionListViewController: UITableViewDelegate {}
