//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionPosterViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var leftFlagImageView: UIImageView!
    @IBOutlet private weak var rightFlagImageView: UIImageView!
}

// MARK: - 뷰 라이프사이클 메서드
extension ExpositionPosterViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePosterView()
    }
}

// MARK: - 뷰 초기 설정 메서드
extension ExpositionPosterViewController {
    func configurePosterView() {
        guard let asset = NSDataAsset.init(name: "exposition_universelle_1900"),
              let poster = try? JSONDecoder().decode(ExpositionPoster.self, from: asset.data) else {
            return
        }
        
        titleLabel.text = poster.title
        // TODO: 방문객 숫자에 numberFormatter 적용하기
        visitorsLabel.text = "방문객 : \(poster.visitors) 명"
        locationLabel.text = "개최지 : \(poster.location)"
        durationLabel.text = "개최 기간 : \(poster.duration)"
        descriptionLabel.text = poster.description
        
        // TODO: 여기서 이미지를 가져오는 것이 괜찮을까?
        posterImageView.image = UIImage(named: "poster")
        leftFlagImageView.image = UIImage(named: "flag")
        rightFlagImageView.image = UIImage(named: "flag")
    }
}

// MARK: - 데이터 옮기는 메서드
extension ExpositionPosterViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let target = segue.destination as? UINavigationController,
              let destinationViewController = target.topViewController as? KoreanEntryTableViewContoller,
              let asset = NSDataAsset.init(name: "items"),
              let entries = try? JSONDecoder().decode([ExpositionEntry].self, from: asset.data) else {
            return
        }

        destinationViewController.entries = entries
    }
}
