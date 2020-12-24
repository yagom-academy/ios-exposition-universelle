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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let destinationViewController = segue.destination as? ExhibitionWorkViewController else { return }
            guard let sender = sender as? Int else { return }
            destinationViewController.imageFile = exhibitionWorks[sender].image
            destinationViewController.descriptionData = exhibitionWorks[sender].description
            destinationViewController.navigationItem.title = exhibitionWorks[sender].name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.backItem?.title = "메인"
        self.navigationController?.navigationBar.topItem?.title = "한국의 출품작"
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
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

extension ExhibitionWorksListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitionWorks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell else {
            fatalError("error발생")
        }
        cell.thumbnail.image = exhibitionWorks[indexPath.row].image
        cell.workName.text = exhibitionWorks[indexPath.row].name
        cell.workDescription.text = exhibitionWorks[indexPath.row].shortDescription
        return cell
    }
}
