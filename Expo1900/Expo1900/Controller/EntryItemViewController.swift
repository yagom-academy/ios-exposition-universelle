//
//  EntryItemViewController.swift
//  Expo1900
//
//  Created by morgan, uemu on 2023/11/02.
//

import UIKit

class EntryItemViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var entryItems: [Exposition.EntryItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        guard let assetData: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        let decoder = JSONDecoder()
        
        do {
            entryItems = try decoder.decode([Exposition.EntryItem].self, from: assetData.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController = segue.destination as? DescriptionViewController else {
            return
        }
    
        nextViewController.imageName = entryItems[indexPath.row]
        nextViewController.descriptionText = "dd"
    }
}

extension EntryItemViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryItems!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryItemCell", for: indexPath) as! EntryItemCell
        
        cell.entryItemTitle.text = entryItems![indexPath.row].name
        cell.entryItemDescription.text = entryItems![indexPath.row].shortDesc
        cell.entryItemImage.image = UIImage(named: entryItems![indexPath.row].imageName)
        
        return cell
    }
}
