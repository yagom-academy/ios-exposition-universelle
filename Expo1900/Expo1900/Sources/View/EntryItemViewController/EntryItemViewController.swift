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
        
        configureNavigationUI()
        useProtocol()
        decodeJSONData()
    }
    
    func configureNavigationUI () {
        self.navigationController?.isNavigationBarHidden = false
        
        let backBarButtonItem = UIBarButtonItem(
            title: "한국의 출품작",
            style: .plain,
            target: self,
            action: nil
        )
        
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    func useProtocol() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func decodeJSONData() {
        guard let assetData: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            let decoder = JSONDecoder()
            entryItems = try decoder.decode([Exposition.EntryItem].self, from: assetData.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension EntryItemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thirdViewController = UIStoryboard(name: "DescriptionDetail", bundle: .main)
        guard let nextViewController = thirdViewController.instantiateViewController(withIdentifier: "DescriptionDetailViewController") as? DescriptionDetailViewController else { return }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
       
        guard let selectedItem = entryItems?[indexPath.row] else { return }
        
        nextViewController.injectData(
            titleName: selectedItem.name,
            descriptionText: selectedItem.description,
            imageName: selectedItem.imageName
        )

    }
}

extension EntryItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let entryItemsCount = entryItems?.count else { return .zero }
        return entryItemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntryItemCell", for: indexPath) as? EntryItemCell else {
            return UITableViewCell()
        }
        
        guard let entryItem = entryItems?[indexPath.row] else {
            return UITableViewCell()
        }

        cell.injectData(
            title: entryItem.name,
            description: entryItem.shortDesc,
            imageName: entryItem.imageName
        )
        
        return cell
    }
}
