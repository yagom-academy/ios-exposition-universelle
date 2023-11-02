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
