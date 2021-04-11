//
//  ExhibitItemViewController.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/09.
//

import UIKit

class ExhibitItemViewController: UIViewController {

    @IBOutlet var exhibitItemImage: UIImageView!
    @IBOutlet var exhibitItemDescriptions: UILabel!
    var tableViewIndex: Int = -1
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tableViewIndex)
        
        switch initExpoData(fileName:"items", model: [ExhibitItem].self) {
        case .success(let data):
            exhibitItemImage.image = UIImage(named: data[tableViewIndex].imageName)
            exhibitItemDescriptions.text = data[tableViewIndex].descriptions
        case .failure(let error):
            print(error.localizedDescription)
        }
        
        // Do any additional setup after loading the view.
    }

}
