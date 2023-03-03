//
//  Expo1900 - ExpoViewController.swift
//  Created by 리지, Rowan.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var numberOfVisitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private var flagImageViews: [UIImageView]!
    @IBOutlet private weak var goButton: UIButton!
    
    private var expoUniverselle: ExpoUniverselle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        setNavigationBar()
        decodeExpoData()
        setMainScene()
        setAccessibilityProperties()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setNavigationBar() {
        let navigationBarTitle = "메인"
        self.navigationItem.title = navigationBarTitle
    }
    
    private func decodeExpoData() {
        self.expoUniverselle = DecodeManager.decodeData(
            of: AssetName.expo, returnType: ExpoUniverselle.self
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
        
        self.titleLabel.text = expoData.title
        self.numberOfVisitorsLabel.text = String(format: LabelText.visitor, decimalVisitors)
        self.locationLabel.text = String(format: LabelText.location, expoData.location)
        self.durationLabel.text = String(format: LabelText.duration, expoData.duration)
        
        convertTextSize(of: numberOfVisitorsLabel)
        convertTextSize(of: locationLabel)
        convertTextSize(of: durationLabel)
        
        self.descriptionLabel.text = expoData.description
    }
    
    private func convertTextSize(of label: UILabel) {
        guard let target = label.text,
              let colonIndex = target.firstIndex(of: ":")else { return }
        
        let leftFont = UIFont.preferredFont(forTextStyle: .title3)
        let rightFont = UIFont.preferredFont(forTextStyle: .body)
        
        let leftDistance = target.distance(from: target.startIndex, to: colonIndex)
        let rightDistance = target.distance(from: colonIndex, to: target.endIndex)
        
        let leftRange = NSMakeRange(0, leftDistance)
        let rightRange = NSMakeRange(leftDistance, rightDistance)
        
        let attributedString = NSMutableAttributedString(string: target)
        attributedString.addAttribute(.font, value: leftFont, range: leftRange)
        attributedString.addAttribute(.font, value: rightFont, range: rightRange)
        
        label.attributedText = attributedString
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
    
    private enum LabelText {
        static let visitor = "방문객 : %@ 명"
        static let location = "개최지 : %@"
        static let duration = "개최 기간 : %@"
    }
}

extension ExpoViewController: UINavigationControllerDelegate {
    func navigationControllerSupportedInterfaceOrientations(
        _ navigationController: UINavigationController
    ) -> UIInterfaceOrientationMask {
        return .portrait
    }
}

extension ExpoViewController {
    private func setAccessibilityProperties() {
        setLabelAccessibility()
        setImageViewAccessibility()
    }
    
    private func setLabelAccessibility() {
        self.titleLabel.accessibilityLabel = "파리 만국박람회 1900"
        self.durationLabel.accessibilityLabel = "개최 기간"
        self.durationLabel.accessibilityValue = "1900년 4월 14일부터 1900년 11월 12일까지"
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
