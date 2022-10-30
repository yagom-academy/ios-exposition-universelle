//  Expo1900 - KoreanEntriesViewController.swift
//  Created by Mangdi, zhilly on 2022/10/18

import UIKit

final class KoreanEntriesViewController: UIViewController {
    
    @IBOutlet private weak var koreanEntriesTableView: UITableView!
    
    private let cellIdentifier = KoreanEntryTableViewCell().cellIdentifier
    private var koreanEntries: [KoreanEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        koreanEntriesTableView.register(
            UINib(nibName: "KoreanEntryTableViewCell", bundle: nil),
            forCellReuseIdentifier: cellIdentifier
        )

        loadKoreanEntries()
        navigationController?.isNavigationBarHidden = false
    }
    
    private func loadKoreanEntries() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            self.koreanEntries = try jsonDecoder.decode([KoreanEntry].self, from: dataAsset.data)
        } catch {
            notifyErrorAlert()
            return
        }
    }
    
    private func notifyErrorAlert() {
        let alert: UIAlertController = UIAlertController(
            title: "파일 없음",
            message: "파일을 읽어올 수 없습니다.",
            preferredStyle: .alert
        )
        let okButton: UIAlertAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}

extension KoreanEntriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.koreanEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell: KoreanEntryTableViewCell = koreanEntriesTableView.dequeueReusableCell(
            withIdentifier: self.cellIdentifier,
            for: indexPath
        ) as? KoreanEntryTableViewCell ?? KoreanEntryTableViewCell()
        
        let entry: KoreanEntry = self.koreanEntries[indexPath.row]
        
        customCell.configureCell(
            imageName: entry.imageName,
            entryName: entry.name,
            description: entry.shortDescription
        )
        
        return customCell
    }
}

extension KoreanEntriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entriesDetailViewController =
        storyboard?.instantiateViewController(withIdentifier: "entriesDetailViewController") as?
        EntriesDetailViewController ?? EntriesDetailViewController()
        
        entriesDetailViewController.koreanEntry = koreanEntries[indexPath.row]
        show(entriesDetailViewController, sender: nil)
    }
}
