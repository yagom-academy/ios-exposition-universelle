//
//  ExpositionItemTableViewController.swift
//  Expo1900
//
//  Created by 양호준 on 2021/12/09.
//

import UIKit

class ExpositionItemTableViewController: UITableViewController {
    // MARK: - Properties
    var expositionItems: [ExpositionItem] = []
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Methods
    func fetchData() {
        do {
            expositionItems = try JSONParser<[ExpositionItem]>.decode(fileName: FileName.items)
        } catch {
            print(error)
        }
    }
    
    func updateUI() {
        self.title = "한국의 출품작"
    }
}

// MARK: - Table view data source
extension ExpositionItemTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpositionItemCell", for: indexPath)
        let expositionItem = expositionItems[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(named: expositionItem.imageName)
        content.text = expositionItem.name
        content.secondaryText = expositionItem.shortDescription
        
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - Table view delegate
extension ExpositionItemTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = self.expositionItems[indexPath.row]
        
        let expositionItemStoryboard = UIStoryboard(name: "ExpositionItem", bundle: nil)

        let expositionItemViewController = expositionItemStoryboard.instantiateViewController(identifier: "expositionItem") { coder in
            return ExpositionItemViewController(coder: coder, expositionItem: selectedItem)
        }

        self.navigationController?.pushViewController(expositionItemViewController, animated: true)
    }
}
