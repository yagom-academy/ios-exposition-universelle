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
    
//    웨더가 알려준 방식 이니셜라이져를 다음과 같이 설정해준다.
//    private let item: Item
//    init?(coder: NSCoder, item: Item) {
//        self.item = item
//        super.init(coder: coder)
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContentsOfScrollView()
        self.title = item?.name
    }
}

//MARK: - logic method
extension DetailViewController {
    private func setContentsOfScrollView() {
        guard let itemImageName = item?.imageName else {
            return
        }
        
        heritageImage.image = UIImage(named: itemImageName)
        heritageDescription.text = item?.description
    }
}
