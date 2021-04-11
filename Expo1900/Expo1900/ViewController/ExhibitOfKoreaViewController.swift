//
//  ExhibitOfKoreaViewController.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/09.
//

import UIKit

class ExhibitOfKoreaViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title="메인"
        self.navigationItem.title = "한국의 출품작"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
}


extension ExhibitOfKoreaViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
            return 11
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            print(indexPath.row)
    
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubtitleCell")  else  {
                return UITableViewCell()
            }
            
            cell.imageView?.image = UIImage(named: "najeon")
            cell.textLabel?.text = "직지심체요절"
            cell.detailTextLabel?.numberOfLines = 0
            cell.detailTextLabel?.text = "직지심체요절직지심체요절직지심체요절직지심체요절직지심체요절직지심체요절직지심체요절직지심체요절직지심체요절직지심체요절직지심체요절직지심체요절직지심체요절직지심체요절직지심체요절"
            
            
            return cell
    
        }
}

extension ExhibitOfKoreaViewController: UITableViewDelegate {


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.performSegue(withIdentifier: "showExhibitOfKoreaItem", sender: nil)
    }
}
