//
//  DetailViewController.swift
//  Expo1900
//
//  Created by marisol on 2022/04/15.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var heritageImage: UIImageView!
    @IBOutlet weak var heritageDescription: UILabel!
    var item: Item?
    private let privateItem: Item
    init?(coder: NSCoder, item: Item) {
        self.privateItem = item
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContentsOfScrollView()
        self.title = item?.name
    }
    
    func setContentsOfScrollView() {
        guard let itemImageName = item?.imageName else {
            return
        }
        
        heritageImage.image = UIImage(named: itemImageName)
        heritageDescription.text = item?.description
    }
}
