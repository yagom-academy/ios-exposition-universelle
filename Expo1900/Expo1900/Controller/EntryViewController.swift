//
//  ExpoEntryViewController.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/02.
//

import UIKit

final class EntryViewController: UIViewController {
    private var expoEntries: [ExpoEntry] = [ExpoEntry]()
    
    @IBOutlet weak var entryTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateEntryTableView()
        updateExpoEntries()
    }
    
    private func updateNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = NameSpace.KoreanEntry
    }
    
    private func updateExpoEntries() {
        do {
            expoEntries = try Decoder.decodeJson(from: AssetsNameSpace.expoEntries)
        } catch DecodeError.searchNoFile {
            print(DecodeError.searchNoFile)
            let alert = AlertController.configureAlert(errorName: DecodeError.searchNoFile.errorDescription)
            present(alert, animated: true)
        } catch {
            print(DecodeError.jsonDecodeError.localizedDescription)
            let alert = AlertController.configureAlert(errorName: DecodeError.jsonDecodeError.errorDescription)
            present(alert, animated: true)
        }
    }

    private func updateEntryTableView() {
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
        
        guard let entryCell = tableView.dequeueReusableCell(withIdentifier: StoryBoardNameSpace.entryCell, for: indexPath) as? EntryTableViewCell else {
            return UITableViewCell()
        }
        
        entryCell.configureView(expoEntry: expoEntry)
        
        return entryCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let expoEntry = self.expoEntries[indexPath.row]
    
        guard let entryDetailViewController = storyboard?.instantiateViewController(withIdentifier: StoryBoardNameSpace.entryDetailViewController) as? EntryDetailViewController else { return }
        
        entryDetailViewController.expoEntry = expoEntry
        
        navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}

extension EntryViewController {
    private enum NameSpace {
        static let KoreanEntry: String = "한국의 출품작"
    }
}
