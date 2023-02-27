//
//  Expo1900 - ItemsViewController.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var exhibitItems: [ExhibitItem] = []
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        exhibitItems = decodeJson()
        navigationItem.title = NameSpace.itemViewTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func decodeJson() -> [ExhibitItem] {
        let emptyArray: [ExhibitItem] = []
        let decoder: JSONDecoder = JSONDecoder()
        
        guard let items: NSDataAsset = NSDataAsset(name: "items") else { return emptyArray }

        guard let decodedItems: [ExhibitItem] = try? decoder.decode([ExhibitItem].self, from: items.data) else { return emptyArray }
        
        return decodedItems
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let exhibitItem: ExhibitItem = exhibitItems[indexPath.row]
        cell.textLabel?.text = exhibitItem.name
        cell.detailTextLabel?.text = exhibitItem.shortDescription
        cell.imageView?.image = UIImage(named: exhibitItem.imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height / 6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "itemDetailView", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemDetailView" {
            guard let exhibitItemView: ExhibitItemViewController = segue.destination as? ExhibitItemViewController,
                  let selectedIndex: Int = tableView.indexPathForSelectedRow?.row else { return }
            
            exhibitItemView.prepareTitle = exhibitItems[selectedIndex].name
            exhibitItemView.prepareImage = exhibitItems[selectedIndex].imageName
            exhibitItemView.prepareDescription = exhibitItems[selectedIndex].description
        }
    }
}
