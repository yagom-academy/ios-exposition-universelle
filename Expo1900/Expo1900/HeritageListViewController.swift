//
//  HeritageListViewController.swift
//  Expo1900
//
//  Created by marisol on 2022/04/15.
//

import UIKit

class HeritageListViewController: UIViewController {

    @IBOutlet var heritageListTableView: UITableView!
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = loadItems() ?? []
        heritageListTableView.dataSource = self
        self.navigationController?.navigationBar.topItem?.title = "메인"
        self.title = "한국의 출품작"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func loadItems() -> [Item]? {
        let jsonManager: JsonManagerable = JsonManager()
        
        do {
            let heritageInfo = try jsonManager.decodedItems()
            return heritageInfo
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

extension HeritageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = heritageListTableView.dequeueReusableCell(withIdentifier: IdentifierName.heritageCell, for: indexPath) as? HeritageListCell else {
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        cell.heritageImage.image = UIImage(named: item.imageName)
        cell.heritageTitleLabel.text = item.name
        cell.heritageShortDescriptionLabel.text = item.shortDescription
        
        return cell
    }
}
