//
//  ExhibitItemViewController.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/09.
//

import UIKit

class ExhibitItemViewController: UIViewController {

    @IBOutlet private var exhibitItemImage: UIImageView!
    @IBOutlet private var exhibitItemDescriptions: UILabel!
    var tableViewIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        switch initExpoData(fileName: FileName.items, model: [ExhibitItem].self) {
        case .success(let data):
            self.navigationItem.title = data[tableViewIndex].name
            exhibitItemImage.image = UIImage(named: data[tableViewIndex].imageName)
            exhibitItemDescriptions.text = data[tableViewIndex].descriptions
        case .failure(let error):
            print(error.localizedDescription)
        }
    
    }

}
