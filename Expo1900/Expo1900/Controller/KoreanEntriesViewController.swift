//
//  KoreanEntriesViewController.swift
//  Expo1900
//
//  Created by Hamo, Mene on 19/10/2022.
//

import UIKit

final class KoreanEntriesViewController: UIViewController {
    @IBOutlet private weak var entriesTableView: UITableView!
    private let jsonDecodingManager: JSONDecodingManager = JSONDecodingManager()
    
    private var koreanEntries: [ExhibitionEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entriesTableView.dataSource = self
        entriesTableView.delegate = self
        fetchKoreanEntries()
    }
    
    private func fetchKoreanEntries() {
        do {
        koreanEntries = try jsonDecodingManager.decode(
            dataAsset: ExpoConstant.koreanEntriesJSONFileName)
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
        guard let entryCell: EntryTableViewCell = entriesTableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath) as? EntryTableViewCell else {
            return UITableViewCell()
        }
        
        entryCell.entryImageView.image = UIImage(named: koreanEntries[indexPath.row].imageName)
        entryCell.entryTitleLabel.text = koreanEntries[indexPath.row].name
        entryCell.enrtyShortDescriptionLabel.text = koreanEntries[indexPath.row].shortDescription
        
        return entryCell
    }
}

extension KoreanEntriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showEntryDetails", sender: indexPath.row)
    }
}
