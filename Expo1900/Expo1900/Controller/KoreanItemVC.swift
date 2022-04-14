//
//  KoreanItemVC.swift
//  Expo1900
//
//  Created by 김태현 on 2022/04/14.
//

import UIKit

class KoreanItemVC: UIViewController {
    @IBOutlet weak var koreanItemsTableView: UITableView!
    
    var koreanItems: [KoreanHistoricalItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        koreanItemsTableView.delegate = self
        koreanItemsTableView.dataSource = self
        initializeKoreanItemsData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func initializeKoreanItemsData() {
        guard let items = try? [KoreanHistoricalItem].decode(from: "items") else {
            return
        }
        koreanItems = items
    }
}

extension KoreanItemVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let koreanItemsCount = koreanItems?.count else { return 0 }
        return koreanItemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KoreanItem", for: indexPath) as? KoreanItemTableViewCell,
           let koreanItems = koreanItems else {
            return KoreanItemTableViewCell()
        }
        cell.titleLabel.text = koreanItems[indexPath.row].name
        cell.descriptionLabel.text = koreanItems[indexPath.row].shortDesciption
        cell.mainImageView.image = UIImage(named: koreanItems[indexPath.row].imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let koreanItemDetailVC = storyboard?.instantiateViewController(withIdentifier: "KoreanItemDetailVC") as? KoreanItemDetailVC else {
            return
        }
        koreanItemDetailVC.koreanItem = koreanItems?[indexPath.row]
        navigationController?.pushViewController(koreanItemDetailVC, animated: true)
    }
}
