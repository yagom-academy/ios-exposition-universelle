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
            debugPrint(error.localizedDescription)
            showErrorAlert()
        }
    }
    
    private func showErrorAlert() {
        let errorAlert = UIAlertController(
            title: "데이터를 불러오는데 실패했습니다.",
            message: nil,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "확인", style: .default)
        errorAlert.addAction(okAction)
        present(errorAlert, animated: true)
    }
}

extension KoreanEntriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreanEntries.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let entryCell: EntryTableViewCell = entriesTableView.dequeueReusableCell(
            withIdentifier: EntryTableViewCell.reuseIdentifier,
            for: indexPath) as? EntryTableViewCell else {
            return UITableViewCell()
        }
        
        guard let koreanEntry = koreanEntries[safe: indexPath.row] else {
            return UITableViewCell()
        }
        
        entryCell.entryImageView.image = UIImage(named: koreanEntry.imageName)
        entryCell.entryTitleLabel.text = koreanEntry.name
        entryCell.entryShortDescriptionLabel.text = koreanEntry.shortDescription
        
        return entryCell
    }
}

extension KoreanEntriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        guard let entryDetailViewController = storyboard?.instantiateViewController(
            identifier: EntryTableViewCell.reuseIdentifier,
            creator: { coder in
                return EntryDetailViewController(entryInformation: self.koreanEntries[indexPath.row],
                                                 coder: coder)
            }) else {
            return
        }
        
        navigationController?.pushViewController(entryDetailViewController, animated: true)
        entriesTableView.deselectRow(at: indexPath, animated: true)
    }
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
