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
    
    func configureCells(_ item : Exhibition, cell: UITableViewCell) {
        cell.imageView?.image = UIImage(named: item.imageName)
        cell.detailTextLabel?.text = item.shortDescription
        cell.textLabel?.text = item.name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ExhibitionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let exhibitionItem: Exhibition = self.items[indexPath.row]
        configureCells(exhibitionItem, cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
}

extension ExhibitionListViewController: UITableViewDelegate {
    
}
