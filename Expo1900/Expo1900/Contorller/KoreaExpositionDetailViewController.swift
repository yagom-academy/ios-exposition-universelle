//
//  KoreaExpositionDetailViewController.swift
//  Expo1900
//
//  Created by Kim Do hyung on 2021/07/12.
//

import UIKit

class KoreaExpositionDetailViewController: UIViewController {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    var koreaExpositionItem: KoreaExposition?

    override func viewDidLoad() {
        super.viewDidLoad()
        matchInitialValue()
    }
    func matchInitialValue() {
        if let unwrappedKoreaExpositionItem = koreaExpositionItem {
            itemImage.image = UIImage(named: unwrappedKoreaExpositionItem.imageName)
            descriptionLabel.text = unwrappedKoreaExpositionItem.description
        }
    }
}

//화면전환을 통해서 오게될 화면
//특정 셀을 선택해서 오게됨
//그 셀에 들어가있는 이미지와 설명을 가져와야함 - 로우에 들어갈 데이터 전달 받기
