//
//  ItemViewController.swift
//  Expo1900
//
//  Created by Rhode, Christy on 2023/02/23.
//

import UIKit

final class ItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var exhibitItems: [ExhibitItem] = []
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        exhibitItems = decodeJson()
        self.tableView.reloadData()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "한국의 출품작"
    }
    
    private func decodeJson() -> [ExhibitItem] {
        let emptyArray: [ExhibitItem] = []
        let decoder = JSONDecoder()
        
        guard let items = NSDataAsset(name: "items") else { return emptyArray }

        guard let decodedItems = try? decoder.decode([ExhibitItem].self, from: items.data) else { return emptyArray }
        
        return decodedItems
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let exhibitItem: ExhibitItem = self.exhibitItems[indexPath.row]
        cell.textLabel?.text = exhibitItem.name
        cell.detailTextLabel?.text = exhibitItem.shortDescription
        cell.imageView?.image = UIImage(named: exhibitItem.imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return self.view.bounds.height / 6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "itemDetailView", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemDetailView" {
            guard let destination = segue.destination as? ExhibitItemViewController,
                  let selectedIndex = self.tableView.indexPathForSelectedRow?.row else { return }
            
            destination.prepareTitle = exhibitItems[selectedIndex].name
            destination.prepareImage = exhibitItems[selectedIndex].imageName
            destination.prepareDescription = exhibitItems[selectedIndex].description
        }
    }
}
