//
//  ExhibitionWorksListViewController.swift
//  Expo1900
//
//  Created by 강인희 on 2020/12/22.
//

import UIKit

class ExhibitionWorksListViewController: UIViewController {
    @IBOutlet weak var workListTableView: UITableView!
    private var exhibitionWorks = [ExhibitionWork]()
    var delegate: SendInformationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "한국의 출품작"
        decodeExhibitionData()
    }
    
    private func decodeExhibitionData() {
        let assetFile: String = "items"
        guard let asset = NSDataAsset(name: assetFile) else {
            fatalError("Can not found data asset.")
        }
        
        do {
            exhibitionWorks = try JSONDecoder().decode([ExhibitionWork].self, from: asset.data)
        } catch {
            print("error: \(error)")
        }
    }
}

extension ExhibitionWorksListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let destinationViewController = self.storyboard?.instantiateViewController(identifier: "exhibitionWork") as? ExhibitionWorkViewController else {
            return
        }
        self.delegate = destinationViewController
        delegate?.send(information: exhibitionWorks[indexPath.row])
        self.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}

extension ExhibitionWorksListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitionWorks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ExhibitionWorkTableViewCell else {
            fatalError("error발생")
        }
        cell.thumbnailImageView.image = exhibitionWorks[indexPath.row].image
        cell.workNameLabel.text = exhibitionWorks[indexPath.row].name
        cell.workDescriptionLabel.text = exhibitionWorks[indexPath.row].shortDescription
        return cell
    }
}
