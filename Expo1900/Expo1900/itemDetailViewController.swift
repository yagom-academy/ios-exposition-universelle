//
//  itemDetailViewController.swift
//  Expo1900
//
//  Created by 사파리, 파프리 on 2022/04/15.
//

import UIKit

final class itemDetailViewController: UIViewController {
    var item: Heritage?
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var ItemDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        title = item?.title
        itemImageView.image = UIImage(named: item?.imageName ?? "swift")
        ItemDescriptionLabel.text = item?.description
    }
}
