//
//  KoreaItemsViewController.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/11.
//

import UIKit

final class KoreanItemTableViewController: UIViewController {
    private let koreanItemTableViewNavigationTitle = "한국의 출품작"
    
    private let koreanItems: [KoreanItem] = {
        var items = [KoreanItem]()
        if let dataAsset = NSDataAsset(name: "items") {
            do {
                items =  try JSONDecoder().decode([KoreanItem].self, from: dataAsset.data)
            } catch {
                items = [KoreanItem]()
            }
        }
        return items
    }()
    
    private let koreanItemTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(KoreanItemCell.self, forCellReuseIdentifier: KoreanItemCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setKoreanItemTableViewTitle()
        setKoreanItemTableViewDelegate()
        setKoreanItemTableViewDataSource()
        setUpKoreanItemTalbeView()
    }
    
    private func setKoreanItemTableViewTitle() {
        navigationItem.title = koreanItemTableViewNavigationTitle
    }
    
    private func setKoreanItemTableViewDelegate() {
        koreanItemTableView.delegate = self
    }
    
    private func setKoreanItemTableViewDataSource() {
        koreanItemTableView.dataSource = self
    }
    
    private func setUpKoreanItemTalbeView() {
        view.addSubview(koreanItemTableView)
        addKoreanItemTableViewConstraints()
    }
    
    private func addKoreanItemTableViewConstraints() {
        NSLayoutConstraint.activate([
            koreanItemTableView.topAnchor.constraint(equalTo: view.topAnchor),
            koreanItemTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            koreanItemTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            koreanItemTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension KoreanItemTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let koreanItemViewcontroller = KoreanItemIntroductionViewController()
        let itemTitle = koreanItems[indexPath.row].name
        let itemImage = UIImage(named: koreanItems[indexPath.row].imageName)
        let itemDescription = koreanItems[indexPath.row].description
        koreanItemViewcontroller.setItemIntroductionContents(title: itemTitle, image: itemImage, description: itemDescription)
        navigationController?.pushViewController(koreanItemViewcontroller, animated: true)
    }
}

extension KoreanItemTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        koreanItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KoreanItemCell.reuseIdentifier, for: indexPath) as? KoreanItemCell else {
            return UITableViewCell()
        }
        let koreanItemData = koreanItems[indexPath.row]
        cell.setKoreanItemCellContents(imageName: koreanItemData.imageName,
                                       title: koreanItemData.name,
                                       shortDescription: koreanItemData.shortDescription)
        return cell
    }
}
