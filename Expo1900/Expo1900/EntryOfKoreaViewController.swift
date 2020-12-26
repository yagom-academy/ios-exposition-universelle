//
//  SecondViewController.swift
//  Expo1900
//
//  Created by 김태형 on 2020/12/26.
//

import UIKit

class EntryOfKoreaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var entryOfKoreaTableView: UITableView!
    
    var entryOfKorea: [EntryOfKorea] = []
    var cellIdentifier: String = "cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryOfKorea.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? EntryTableViewCell else {
            debugPrint("CellError")
            return UITableViewCell()
        }
        
        let entry = entryOfKorea[indexPath.row]

        cell.entryImage.image = UIImage(named: entry.imageName)
        cell.entryTitle.text = entry.name
        cell.entryShortDescription.text = entry.shortDescription
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = entryOfKoreaTableView.indexPathForSelectedRow, let detailView = segue.destination as? DetailOfEntryViewController else {
            return
        }
        detailView.entry = entryOfKorea[indexPath.row]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false

        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "items") else {
            return
        }
        do {
            self.entryOfKorea = try jsonDecoder.decode([EntryOfKorea].self, from: dataAsset.data)
        } catch {
            debugPrint("Error")
        }
    }
}
