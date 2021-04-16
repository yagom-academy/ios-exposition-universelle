//
//  KoreaItemsViewController.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/11.
//

import UIKit

final class KoreanItemTableViewController: UIViewController {
    private let koreanItemTableViewNavigationTitle = "한국의 출품작"
    
    private var koreanItems: [KoreanItem]?
    
    private let koreanItemTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(KoreanItemCell.self, forCellReuseIdentifier: KoreanItemCell.reuseIdentifier)
        return tableView
    }()
    
    var errorList = [ExpositionError]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JsonFetcher.fetchJsonData(dataAssetName: "items", completionHandler: fetchKoreanItemsData(result:))
        view.backgroundColor = .white
        setKoreanItemTableViewTitle()
        setKoreanItemTableViewDelegate()
        setKoreanItemTableViewDataSource()
        setUpKoreanItemTalbeView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        showFailAlerts()
    }
    
    private func fetchKoreanItemsData(result: Result<[KoreanItem], ExpositionError>) {
        switch result {
        case .success(let koreanItemsData):
            self.koreanItems = koreanItemsData
        case .failure(let jsonError):
            errorList.append(jsonError)
            self.koreanItems = nil
        }
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
        
        guard let itemTitle = koreanItems?[indexPath.row].name,
              let imageName = koreanItems?[indexPath.row].imageName,
              let itemImage = UIImage(named: imageName),
              let itemDescription = koreanItems?[indexPath.row].description else {
            return
        }
        
        koreanItemViewcontroller.setItemIntroductionContents(title: itemTitle, image: itemImage, description: itemDescription)
        navigationController?.pushViewController(koreanItemViewcontroller, animated: true)
    }
}

extension KoreanItemTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let count = koreanItems?.count else {
            return 0
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KoreanItemCell.reuseIdentifier, for: indexPath) as? KoreanItemCell,
              let koreanItemData = koreanItems?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.setKoreanItemCellContents(imageName: koreanItemData.imageName,
                                       title: koreanItemData.name,
                                       shortDescription: koreanItemData.shortDescription)
        return cell
    }
}
