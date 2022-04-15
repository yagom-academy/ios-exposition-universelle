//
//  HeritageListViewController.swift
//  Expo1900
//
//  Created by marisol on 2022/04/15.
//

import UIKit

class HeritageListViewController: UIViewController {

    @IBOutlet var heritageListTableView: UITableView!
    private var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = loadItems() ?? []
        heritageListTableView.dataSource = self
        heritageListTableView.delegate = self
        self.navigationController?.navigationBar.topItem?.title = "메인"
        self.title = "한국의 출품작"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - UITableViewDataSource method
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

//MARK: - UITableViewDelegate method
extension HeritageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//      웨더가 알려준 방식 - detailViewController 를 이니셜라이져로 item을 할당하는 방식, 이 방법은 detailViewController의 item을
//      private로 선언할수 있어서 외부에서 변경을 방지할 수 있다.
//        let viewController = UIStoryboard(name: IdentifierName.detailViewController, bundle: .main).instantiateInitialViewController { coder -> DetailViewController? in
//            DetailViewController(coder: coder, item: self.items[indexPath.row])
//        }
        
        guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: IdentifierName.detailViewController) as? DetailViewController else {
            return
        }
        
        detailViewController.item = items[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

//MARK: - logic method
extension HeritageListViewController {
    private func loadItems() -> [Item]? {
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
