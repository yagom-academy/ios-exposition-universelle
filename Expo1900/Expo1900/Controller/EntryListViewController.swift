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
        let dataAssetName = "items"
        
        do {
            entryList = try Decoder.decodeJSON(dataAssetName)
        } catch {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            
            switch error {
            case DecoderError.notFoundAsset:
                alert.message = "에셋을 찾을 수 없습니다."
            case DecoderError.decodeFailed:
                alert.message = "디코딩에 실패했습니다."
            default:
                alert.message = "알 수 없는 에러"
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
        let cellIdentifier = "entryCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
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
        let storyboardName = "Main"
        let storyboardId = "EntryDetailViewController"
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        
        if let entryList {
            let entryDetailViewController = storyboard.instantiateViewController(identifier: storyboardId) { coder in
                EntryDetailViewController(entry: entryList[indexPath.row], coder: coder)
            }
            
            navigationController?.pushViewController(entryDetailViewController, animated: true)
        }
    }
}
