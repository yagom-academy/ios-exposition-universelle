//
//  KoreaExpositionViewController.swift
//  Expo1900
//
//  Created by 김준건 on 2021/07/07.
//

import UIKit

protocol DataSendable {
    func sendData(item: KoreaExposition)
}

class KoreaExpositionViewController: UIViewController {
    @IBOutlet weak var koreaExpositionTableView: UITableView!
    private var koreaExpositions: [KoreaExposition] = []
    private let tableViewCellIdentifer: String = "KoreaExpositionCell"
    private let viewTitle: String = "한국의 출품작"
    private let moveToDetailSegueName: String = "MoveToDetail"

    var delegate: DataSendable?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = viewTitle
        decodingKoreaExpositionData()
        koreaExpositionTableView.dataSource = self
        koreaExpositionTableView.delegate = self
    }
    
    func moveToDetail(indexPath: IndexPath) {
        let koreaExpostionDetailStoryBoard = UIStoryboard.init(name: "KoreaExpositionDetail", bundle: nil)
        guard let koreaExpostionDetailVC = koreaExpostionDetailStoryBoard.instantiateViewController(withIdentifier: "KoreaExpositionDetailVC") as? KoreaExpositionDetailViewController else {
            return
        }
        self.delegate = koreaExpostionDetailVC
        delegate?.sendData(item: koreaExpositions[indexPath.row])
        self.navigationController?.pushViewController(koreaExpostionDetailVC, animated: true)
    }
    
    private func decodingKoreaExpositionData() {
        let decoder: JSONDecoder = JSONDecoder()
        if let dataAsset: NSDataAsset = NSDataAsset.init(name: "items") {
            do {
                koreaExpositions = try decoder.decode([KoreaExposition].self, from: dataAsset.data)
            } catch {
                print("Decoding Error")
            }
        }
    }
}

extension KoreaExpositionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaExpositions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifer, for: indexPath)
        guard let customCell = cell as? KoreaExpositionCustomCell else {
            return cell
        }
        let koreaExpositionItem: KoreaExposition = koreaExpositions[indexPath.row]
        customCell.configuateCell(item: koreaExpositionItem)

        return customCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToDetail(indexPath: indexPath)
    }
}
