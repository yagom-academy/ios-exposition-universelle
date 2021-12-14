//
//  ExpositionItemTableViewController.swift
//  Expo1900
//
//  Created by 양호준 on 2021/12/09.
//

import UIKit

class ExpositionItemTableViewController: UITableViewController {
    // MARK: - Properties
    private var expositionItems: [ExpositionItem] = []
    private let jsonParser = JSONParser<[ExpositionItem]>()
    
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
    private func fetchData() {
        do {
            expositionItems = try jsonParser.decode(fileName: AssetFileName.items)
        } catch {
            print(error)
        }
    }
    
    private func updateUI() {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifierName.expositionItemCell, for: indexPath)
        let expositionItem = expositionItems[indexPath.row]
        let configuredCell = configureCell(of: cell, with: expositionItem)
        
        return configuredCell
    }
    
    private func configureCell(of cell: UITableViewCell, with data: ExpositionItem) -> UITableViewCell {
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            
            content.image = UIImage(named: data.imageName)
            content.text = data.name
            content.secondaryText = data.shortDescription
            
            cell.contentConfiguration = content
        } else {
            cell.imageView?.image = UIImage(named: data.imageName)
            cell.textLabel?.text = data.name
            cell.detailTextLabel?.text = data.shortDescription
        }
        
        return cell
    }
}

// MARK: - Table view delegate
extension ExpositionItemTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = self.expositionItems[indexPath.row]
        
        let expositionItemViewController = ViewControllerFactory.createViewController(of: .expositionItem(data: selectedItem))

        self.navigationController?.pushViewController(expositionItemViewController, animated: true)
    }
}
