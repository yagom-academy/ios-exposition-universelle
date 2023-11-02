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
        
        return cell
    }
}
