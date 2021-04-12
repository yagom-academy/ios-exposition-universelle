//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by seungwoo kim on 2021/04/10.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    var exhibitedItem: ExhibitedItem?
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        itemImage.image = UIImage(named: exhibitedItem?.imageName ?? "")
        
        itemDescription.text = exhibitedItem?.description
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
