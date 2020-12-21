//
//  TableViewController.swift
//  Expo1900
//
//  Created by 임리나 on 2020/12/21.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIndentifier: String = "cell"
    var entries: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeData()
        self.tableView.register(UITableViewCell.self,forCellReuseIdentifier: cellIndentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func decodeData() {
        guard let dataAsset = NSDataAsset(name: "items") else { return }
        let jsonDecoder = JSONDecoder()
        
        do {
            self.entries = try jsonDecoder.decode([Entry].self, from: dataAsset.data)
        } catch {
            debugPrint("ERROR")
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  cellIndentifier, for: indexPath)
        let entry = entries[indexPath.row]
        
        cell.textLabel?.text = entry.name
        cell.detailTextLabel?.text = entry.shortDescription
        cell.imageView?.image = entry.image

//        var content = cell.defaultContentConfiguration()
//
//        content.text = entry.name
//        content.secondaryText = entry.shortDescription
//        content.image = UIImage(named: entry.imageName)
//
//        cell.contentConfiguration = content
        return cell
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController: DetailViewController = segue.destination as? DetailViewController else { return }
        guard let cell: UITableViewCell = sender as? UITableViewCell else { return }
        
        //  detailViewController.entry = cell.defaultContentConfiguration()
    }
    */
}
