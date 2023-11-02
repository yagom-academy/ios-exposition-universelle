//
//  ExpositionItemViewController.swift
//  Expo1900
//
//   Created by jyubong, mireu
//

import UIKit

class ExpositionItemViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var expositionItems: [ExpositionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        decodeData()
    }
    
    func decodeData() {
        let decoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            expositionItems = try decoder.decode([ExpositionItem].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension ExpositionItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        let item = expositionItems[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = item.name
        content.secondaryText = item.shortDescription
        content.image = UIImage(named: item.imageName)
        
        let imageSize = CGSize(width: 60, height: 60)
        content.imageProperties.maximumSize = imageSize
        content.imageProperties.reservedLayoutSize = imageSize
        
        cell.contentConfiguration = content
        
        return cell
    }
}
