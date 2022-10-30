//
//  ExhibitionListViewController.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/20.
//

import UIKit

final class ExhibitionListViewController: UIViewController {
    private var itemsOfExposition: [Exhibition] = []
    
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewInit()
        decodeDataAsset(name: Constant.exhibitionListAssetName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let exhibitionViewController = segue.destination as? ExhibitionViewController else {
            return
        }
        guard let cell = sender as? ExhibitionListTableViewCell else {
            return
        }
        
        exhibitionViewController.exhibition = exhibition(named: cell.text)
    }
    
    private func tableViewInit() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func decodeDataAsset(name: String) {
        guard let itemsOfExposition = JSONDecoder.decodeAsset(name: name, to: [Exhibition].self) else {
            return
        }
        
        self.itemsOfExposition = itemsOfExposition
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
        return itemsOfExposition.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: Exhibition = itemsOfExposition[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExhibitionListTableViewCell.identifier, for: indexPath) as? ExhibitionListTableViewCell else {
            let cell = ExhibitionListTableViewCell()
            
            return cell
        }
        
        cell.configure(item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ExhibitionListViewController: UITableViewDelegate {}
