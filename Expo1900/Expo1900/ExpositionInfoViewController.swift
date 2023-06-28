//
//  Expo1900 - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ExpositionInfoViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var openPeriodLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tapPushButton: UIButton!
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        return formatter
    }()
    
    private let jsonDecoder: JsonDecoder = JsonDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showExpositionInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 코드 사용 시
        scrollView.updateContentSize()
    }
    
    private func showExpositionInfo() {
        guard let receiveExpositionData = receiveExpositionInfo() else {
            return
        }
        
        do {
            let decodingExposition = try jsonDecoder.decodingContentInfo(with: receiveExpositionData, modelType: Exposition.self)
            updateMainViewLabels(with: decodingExposition)
        } catch {
            print(error)
        }
    }
    
    private func receiveExpositionInfo() -> Data? {
        guard let file = NSDataAsset(name: "exposition_universelle_1900") else {
            return nil
        }
        
        return file.data
    }
    
    private func updateMainViewLabels(with exposition: Exposition) {
        guard let visitors = numberFormatter
            .string(from: NSNumber(value: exposition.visitors)) else {
            return
        }
        
        titleLabel.text = exposition.title
        visitorLabel.text = "방문객 : \(visitors)명"
        locationLabel.text = "개최지 : \(exposition.location)"
        openPeriodLabel.text = "개최 기간 : \(exposition.duration)"
        descriptionLabel.text = exposition.description
    }
}

extension UIScrollView {
    func updateContentSize() {
        let unionCalculatedTotalRect = recursiveUnionInDepthFor(view: self)
        
        // 계산된 크기로 컨텐츠 사이즈 설정
        self.contentSize = CGSize(width: self.frame.width, height: unionCalculatedTotalRect.height+50)
    }
    
    private func recursiveUnionInDepthFor(view: UIView) -> CGRect {
        var totalRect: CGRect = .zero
        
        // 모든 자식 View의 컨트롤의 크기를 재귀적으로 호출하며 최종 영역의 크기를 설정
        for subView in view.subviews {
            totalRect = totalRect.union(recursiveUnionInDepthFor(view: subView))
        }
        
        // 최종 계산 영역의 크기를 반환
        return totalRect.union(view.frame)
    }
}


