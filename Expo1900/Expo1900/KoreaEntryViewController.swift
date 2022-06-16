//
//  KoreaEntryViewController.swift
//  Expo1900
//
//  Created by 이예은 on 2022/06/15.
//

import UIKit

class KoreaEntryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var koreaEntry = [Exhibits]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseExpositionUniverselleData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "한국의 출품작"
        //        navigationItem.backButtonTitle = "메인"
        //        self.navigationController?.navigationBar.topItem?.title = "한국의 출품작"
        //        navigationController?.navigationBar.topItem?.backButtonTitle = "메인"
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        guard segue.identifier == "transferToDetailsVC" else {
    //            return
    //        }
    //
    //        guard let destination = segue.destination as? KoreaEntryDetailsViewController,
    //              let index = self.tableView.indexPathForSelectedRow?.row else {
    //                  return
    //              }
    //
    //        destination.detailImage!.image = UIImage(named: koreaEntry[index].imageName)
    //    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "transferToDetailsVC" {
            let destination = segue.destination as? KoreaEntryDetailsViewController
            if let index = self.tableView.indexPathForSelectedRow?.row {
                destination?.someImage = koreaEntry[index].imageName
                destination?.someDescription = koreaEntry[index].description
                destination?.entryTitle = koreaEntry[index].name
            }
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        if segue.identifier == "transferToDetailsVC" {
//            let destination = segue.destination as? KoreaEntryDetailsViewController
//            if let index = self.tableView.indexPathForSelectedRow?.row {
//                let imageName = koreaEntry[index].imageName
//                
//                destination?.someImageView = UIImageView(image: UIImage(named: imageName))
//                destination?.someDescription = UILabel(koreaEntry[index].description)
//            }
//        }
//    }
    
    private func parseExpositionUniverselleData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            self.koreaEntry = try jsonDecoder.decode([Exhibits].self, from: dataAsset.data)
        } catch {
            handleError(error)
        }
    }
    
    private func handleError(_ error: Error) {
        switch error {
        case ExpoError.decoding:
            print(ExpoError.decoding.localizedDescription)
        default:
            print("unknown error!!")
        }
    }
    
    
}

extension KoreaEntryViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaEntry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = koreaEntry[indexPath.row].name
        content.secondaryText = koreaEntry[indexPath.row].shortDescription
        content.image = UIImage(named: koreaEntry[indexPath.row].imageName)
        //        content.imageProperties.topAnchor.constraint(equalTo: content.text).isActive = true
        
        content.imageProperties.maximumSize.width = 50
        content.imageProperties.maximumSize.height = 50
        //        content.textProperties.adjustsFontSizeToFitWidth = true
        
        // 더 알아보는 걸로...!
        //        content.imageProperties.reservedLayoutSize = CGSize(width: 5, height: 10)
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
}
