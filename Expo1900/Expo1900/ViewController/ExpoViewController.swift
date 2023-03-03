//
//  Expo1900 - ExpoViewController.swift
//  Created by 리지, Rowan.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorSubtitleLabel: UILabel!
    @IBOutlet private weak var numberOfVisitorsLabel: UILabel!
    @IBOutlet private weak var locationSubtitleLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationSubtitileLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private var flagImageViews: [UIImageView]!
    @IBOutlet private weak var goButton: UIButton!
   
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    private var expoUniverselle: ExpoUniverselle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        decodeExpoData()
        setMainScene()
        setAccessibilityProperties()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        appDelegate?.shouldSupportAllOrientation = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        appDelegate?.shouldSupportAllOrientation = true
    }
    
    private func setNavigationBar() {
        let navigationBarTitle = "메인"
        self.navigationItem.title = navigationBarTitle
    }
    
    private func decodeExpoData() {
        self.expoUniverselle = DecodeManager.decodeData(
            of: AssetName.expo, type: ExpoUniverselle.self
        ) ?? nil
    }
    
    private func setMainScene() {
        guard let expoData = self.expoUniverselle else { return }
        
        setImages()
        setLabels(from: expoData)
    }
    
    private func setImages() {
        guard let poster = UIImage(named: AssetName.poster),
              let flag = UIImage(named: AssetName.flag) else { return }
        
        self.posterImageView.image = poster
        self.flagImageViews.forEach { $0.image = flag }
    }
    
    private func setLabels(from expoData: ExpoUniverselle) {
        guard let decimalVisitors = convertToDecimal(
            from: expoData.numberOfVisitors
        ) else { return }
        
        self.visitorSubtitleLabel.text = Subtitle.visitor
        self.numberOfVisitorsLabel.text = " : \(decimalVisitors) 명"
        self.locationSubtitleLabel.text = Subtitle.location
        self.locationLabel.text = " : \(expoData.location)"
        self.durationSubtitileLabel.text = Subtitle.duration
        self.durationLabel.text = " : \(expoData.duration)"

        self.titleLabel.text = expoData.title
        self.descriptionLabel.text = expoData.description
    }
    
    private func convertToDecimal(from visitors: Int) -> String? {
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .decimal
        
        guard let decimalVisitors = numberformatter.string(for: visitors) else { return nil }
        
        return decimalVisitors
    }
    
    @IBAction private func touchUpGoButton(_ sender: UIButton) {
        let identifier = "ItemEntryViewController"
        guard let nextViewController = self.storyboard?.instantiateViewController(
            withIdentifier: identifier
        ) else { return }
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private enum AssetName {
        static let expo = "exposition_universelle_1900"
        static let poster = "poster"
        static let flag = "flag"
    }
    
    private enum Subtitle {
        static let visitor = "방문객"
        static let location = "개최지"
        static let duration = "개최 기간"
    }
}

extension ExpoViewController {
    private func setAccessibilityProperties() {
        setLabelAccessibility()
        setImageViewAccessibility()
    }
    
    private func setLabelAccessibility() {
        self.titleLabel.accessibilityLabel = "파리 만국박람회 1900"
        self.durationLabel.accessibilityLabel = "1900년 4월 14일부터 1900년 11월 12일까지"
        self.descriptionLabel.accessibilityLabel = "1900년 파리 만국박람회 설명"
        self.goButton.accessibilityHint = "한국의 출품작 화면으로 이동합니다."
    }
    
    private func setImageViewAccessibility() {
        self.posterImageView.isAccessibilityElement = true
        self.posterImageView.accessibilityLabel = "박람회 포스터"
        self.posterImageView.accessibilityTraits = .image
        
        self.flagImageViews.forEach {
            $0.isAccessibilityElement = true
            $0.accessibilityTraits = .image
        }
        self.flagImageViews[0].accessibilityLabel = "버튼 오른쪽 태극기"
        self.flagImageViews[1].accessibilityLabel = "버튼 왼쪽 태극기"
    }
}
