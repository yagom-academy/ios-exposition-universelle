//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/06/27.
//

import UIKit

final class EntryListViewController: UIViewController {
    private var entryList: [Entry]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeEntryList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "한국의 출품작"
    }
    
    private func decodeEntryList() {
        do {
            entryList = try Decoder.decodeJSON(DataAssetNamespace.entryList)
        } catch {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            
            switch error {
            case DecoderError.notFoundAsset:
                alert.message = DecoderError.notFoundAsset.description
            case DecoderError.decodeFailed:
                alert.message = DecoderError.decodeFailed.description
            default:
                alert.message = DecoderError.unexpectedError.description
            }
            
            present(alert, animated: true)
        }
    }
}

//MARK: UITableViewDataSource
extension EntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardNamespace.ID.entryCell, for: indexPath)
        
        guard let entryCell = cell as? EntryTableViewCell else {
            return cell
        }
        
        if let entryList {
            entryCell.configureCell(with: entryList[indexPath.row])
        }
        
        return entryCell
    }
}

//MARK: UITableViewDelegate
extension EntryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: StoryboardNamespace.Name.main, bundle: Bundle.main)
        
        if let entryList {
            let entryDetailViewController = storyboard.instantiateViewController(identifier: StoryboardNamespace.ID.entryDetailViewController) { coder in
                EntryDetailViewController(entry: entryList[indexPath.row], coder: coder)
            }
            
            navigationController?.pushViewController(entryDetailViewController, animated: true)
        }
    }
}
