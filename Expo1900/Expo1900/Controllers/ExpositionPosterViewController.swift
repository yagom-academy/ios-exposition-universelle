//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionPosterViewController: UIViewController {

}

// MARK: - 뷰 라이프사이클 메서드
extension ExpositionPosterViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
}

extension ExpositionPosterViewController {
    func configure() {
        guard let asset = NSDataAsset.init(name: "exposition_universelle_1900"),
              let poster = try? JSONDecoder().decode(ExpositionPoster.self, from: asset.data) else {
            return
        }
        
        // TODO: IBOutlet 생성하고, poster 인스턴스의 각 프로퍼티를 알맞은 IBOutlet에 채워넣자.
        // TODO: ExpositionPoster 모델에 해당하는 데이터는 이미지 이름을 따로 가리키고 있지 않다. 어떻게 이미지를 미리 가져와서 뷰에 쏴줄 수 있을지 생각해보자.
    }
}
