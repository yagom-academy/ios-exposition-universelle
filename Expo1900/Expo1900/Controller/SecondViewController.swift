//
//  SecondViewController.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    var expoItems: [ExpoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self
        decodeData()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "메인", style: .plain, target: self, action: nil)
        
    }
    
    func decodeData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            self.expoItems = try jsonDecoder.decode([ExpoItem].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        self.listTableView.reloadData()
    }
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.expoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = listTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListTableViewCell else { return UITableViewCell()}

        guard let cell = listTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        cell.expoTitleLabel.text = self.expoItems[indexPath.row].name
        cell.expoShortDescriptionLabel.text = self.expoItems[indexPath.row].shortDescription
        cell.expoShortDescriptionLabel.numberOfLines = 0
        cell.expoImageView.image = UIImage(named: self.expoItems[indexPath.row].imageName)
        
        return cell
    }
}
