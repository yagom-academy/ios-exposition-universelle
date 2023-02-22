//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by kaki on 2023/02/22.
//

import UIKit

class ItemDetailViewController: UIViewController {
    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var itemDescription: UILabel!
    
    var itemData: ExpositionUniverselleItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
