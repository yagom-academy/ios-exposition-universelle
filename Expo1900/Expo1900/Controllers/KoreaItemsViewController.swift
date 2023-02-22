//
//  KoreaItemsViewController.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/21.
//

import UIKit

final class KoreaItemsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let cellIdentifier: String = "cell"
    private var expositionItems: [ExpositionUniverselleItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        setupTableView()
        loadExpositionItemsData()
    }
    
    private func setupNavigation() {
        self.navigationController?.isNavigationBarHidden = false
        self.title = "한국의 출품작"
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadExpositionItemsData() {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: AssetName.items) else { return }
        
        do {
            expositionItems = try jsonDecoder.decode([ExpositionUniverselleItem].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension KoreaItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) else {
            return UITableViewCell()
        }
        
        let item = expositionItems[indexPath.row]
        var content = cell.defaultContentConfiguration()
        let image = UIImage(named: item.imageName)
        
        content.image = squreImage(at: image)
        content.imageToTextPadding = CGFloat(5)
        content.text = item.name
        content.secondaryText = item.shortDescription
        content.textProperties.font = .preferredFont(forTextStyle: .title1)
        content.secondaryTextProperties.font = .preferredFont(forTextStyle: .body)
        cell.contentConfiguration = content
        
        return cell
    }
    
    private func squreImage(at image: UIImage?, length: CGFloat = 60) -> UIImage? {
        guard let image = image else { return image }
        
        let originWidth: CGFloat = image.size.width
        let originHeigth: CGFloat = image.size.height
        var resizedWidth: CGFloat = length
        var resizedHeight: CGFloat = length
        
        UIGraphicsBeginImageContext(CGSize(width: length, height: length))
        UIColor.clear.set()
        UIRectFill(CGRect(x: 0.0, y: 0.0, width: length, height: length))
        
        let sizeRatio = length / max(originWidth, originHeigth)
        if originWidth > originHeigth {
            resizedWidth = length
            resizedHeight = originHeigth * sizeRatio
        } else {
            resizedWidth = originWidth * sizeRatio
            resizedHeight = length
        }
        
        image.draw(in: CGRect(x: length / 2 - resizedWidth / 2,
                              y: length / 2 - resizedHeight / 2,
                              width: resizedWidth,
                              height: resizedHeight))
        
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
}

extension KoreaItemsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            let indexPathRow = self.tableView.indexPath(for: cell)!.row
            let itemDetailVC = segue.destination as! ItemDetailViewController
            itemDetailVC.itemData = expositionItems[indexPathRow]
        }
    }
}
