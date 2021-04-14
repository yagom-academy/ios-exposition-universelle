////
////  SecondViewController.swift
////  Expo1900
////
////  Created by Sunny on 2021/04/14.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var tableView: UITableView!
//    let cellIdentifier: String = "cell"
////    var exposition: ExpoItem?
//
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return self.exposition.count
////    }
//
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
////
////        let expoItem: ExpoItem = self.exposition[indexPath.row]
////        cell.textLabel?.text = expoItem.expoTitle
////        cell.detailTextLabel?.text = expoItem.description
////        return cell
////    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//        var exposition: ExpoItem
//
//        let jsonDecoder: JSONDecoder = JSONDecoder()
//        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition") else {
//            return
//        }
//
//        do {
//            exposition = try jsonDecoder.decode(ExpoItem.self, from: dataAsset.data)
//            print(exposition.expoTitle)
//            print(exposition.description)
//            print(exposition.location)
//            print(exposition.numberOfVisitors)
//            print(exposition.openingPeriod)
//        } catch {
//            print(error.localizedDescription)
//        }
//
////        self.tableView.reloadData()
//        }
//}
