//
//  KoreaEntryViewController.swift
//  Expo1900
//
//  Created by 이예은 on 2022/06/15.
//

import UIKit

class KoreaEntryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var koreaEntry = [Exhibits]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseExpositionUniverselleData()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func parseExpositionUniverselleData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            self.koreaEntry = try jsonDecoder.decode([Exhibits].self, from: dataAsset.data)
        } catch {
            handleError(error)
        }
    }
    
    private func handleError(_ error: Error) {
        switch error {
        case ExpoError.decoding:
            print(ExpoError.decoding.localizedDescription)
        default:
            print("unknown error!!")
        }
    }
}

extension KoreaEntryViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaEntry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = koreaEntry[indexPath.row].name
        content.secondaryText = koreaEntry[indexPath.row].shortDescription
        content.image = UIImage(named: koreaEntry[indexPath.row].imageName)
        content.imageProperties.maximumSize.height = 30
        content.imageProperties.maximumSize.width = 30
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}
