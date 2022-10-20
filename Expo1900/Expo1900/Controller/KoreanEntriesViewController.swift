//
//  KoreanEntriesViewController.swift
//  Expo1900
//
//  Created by Hamo, Mene on 19/10/2022.
//

import UIKit

final class KoreanEntriesViewController: UIViewController {
    @IBOutlet private weak var entriesTableView: UITableView!
    
    private var koreanEntries: [ExhibitionEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entriesTableView.dataSource = self
        entriesTableView.delegate = self
        fetchKoreanEntries()
    }
    
    private func fetchKoreanEntries() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(
            name: ExpoConstant.koreanEntriesJSONFileName) else {
            return
        }
        
        do {
            self.koreanEntries = try jsonDecoder.decode([ExhibitionEntry].self,
                                                        from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let entryDetailViewController = segue.destination as? EntryDetailViewController else {
            return
        }
        
        guard let row = sender as? Int else {
            return
        }
        
        entryDetailViewController.entryImage = UIImage(named: koreanEntries[row].imageName)
        entryDetailViewController.entryDescription = koreanEntries[row].description
        entryDetailViewController.entryName = koreanEntries[row].name
    }
}

extension KoreanEntriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreanEntries.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = entriesTableView.dequeueReusableCell(withIdentifier: "cell",
                                                                         for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: koreanEntries[indexPath.row].imageName)
        content.text = koreanEntries[indexPath.row].name
        content.secondaryText = koreanEntries[indexPath.row].shortDescription
        cell.contentConfiguration = content
        return cell
    }
}

extension KoreanEntriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showEntryDetails", sender: indexPath.row)
    }
}
