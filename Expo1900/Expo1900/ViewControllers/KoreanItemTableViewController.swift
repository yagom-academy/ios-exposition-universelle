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
        fetchKoreanItems()
        setKoreanItemTableViewTitle()
        setKoreanItemTableViewDelegate()
        setKoreanItemTableViewDataSource()
        setUpKoreanItemTalbeView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        showFailAlerts()
    }
    
    private func fetchKoreanItems() {
        JsonFetcher.fetchJsonData(dataAssetName: "items", completionHandler: fetchKoreanItemsDataCompletionHandler(result:))
    }
    
    private func fetchKoreanItemsDataCompletionHandler(result: Result<[KoreanItem], ExpositionError>) {
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
        
        guard let item = koreanItems?[indexPath.row] else {
            return
        }
        let itemTitle = item.name
        
        let itemImage = UIImageView()
        ImageFetcher.fetchImageData(for: itemImage, imageFileName: item.imageName,
                                    completionHandler: fetchImageDataCompletionHandler(imageView:result:))
        let itemDescription = item.description
        koreanItemViewcontroller.setItemIntroductionContents(title: itemTitle, image: itemImage.image, description: itemDescription)
        navigationController?.pushViewController(koreanItemViewcontroller, animated: true)
    }
    
    private func fetchImageDataCompletionHandler(imageView: UIImageView, result: Result<UIImage, ExpositionError>) {
        switch result {
        case .success(let image):
            imageView.image = image
            
        case .failure(let imageError):
            errorList.append(imageError)
            imageView.image = nil
        }
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
