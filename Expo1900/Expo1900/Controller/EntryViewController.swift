//
//  ExpoEntryViewController.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/02.
//

import UIKit

class EntryViewController: UIViewController {

    var expoEntries: [ExpoEntry] = [ExpoEntry]()
    @IBOutlet weak var entryTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "한국의 출품작"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateExpoEntries()
        updateEntryTableView()
    }
    
    func updateExpoEntries() {
        do {
            expoEntries = try Decoder.decodeJson(from: "items")
        } catch DecodeError.searchNoFile {
            print(DecodeError.searchNoFile.localizedDescription)
        } catch {
            print(DecodeError.jsonDecodeError.localizedDescription)
        }
    }
    
    func updateEntryTableView() {
        entryTableView.dataSource = self
        entryTableView.delegate = self
    }
}

extension EntryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expoEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expoEntry = expoEntries[indexPath.row]
        
        guard let entryCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EntryTableViewCell else {
            return UITableViewCell()
        }
        
        entryCell.configureView(expoEntry: expoEntry)
        
        return entryCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let expoEntry = self.expoEntries[indexPath.row]
    
        guard let entryDetailViewController = storyboard?.instantiateViewController(withIdentifier: "entryDetailViewController") as? EntryDetailViewController else { return }
        
        entryDetailViewController.expoEntry = expoEntry
        
        navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}
