//
//  Expo1900 - ViewController.swift
//  Created by sunnyCookie, Wonbi
// 

import UIKit

final class ExpoMainViewController: UIViewController {
    private var expoInformation: ExpoInformation?
    
    @IBOutlet weak private var titleLable: UILabel!
    @IBOutlet weak private var posterImage: UIImageView!
    @IBOutlet weak private var visitorLabel: UILabel!
    @IBOutlet weak private var localeLabel: UILabel!
    @IBOutlet weak private var periodLabel: UILabel!
    @IBOutlet weak private var descriptionTextView: UITextView!
    @IBOutlet private var flagImages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let expoInformationData = JSONDecoder.decode(
            ExpoInformation.self,
            from: "exposition_universelle_1900"
        ) else { return }
        
        expoInformation = expoInformationData
        setupNavigationBar()
        setupExpoMainView()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        title = "메인"
    }
    
    private func setupExpoMainView() {
        guard let expoInformation = expoInformation else { return }
        
        titleLable.text = expoInformation.title
        titleLable.numberOfLines = 0
        posterImage.image = UIImage(named: "poster")
        visitorLabel.text = "방문객 : \(expoInformation.visitors) 명"
        localeLabel.text = "개최지 : \(expoInformation.location)"
        periodLabel.text = "개최 기간 : \(expoInformation.duration)"
        descriptionTextView.text = expoInformation.description
        
        flagImages.forEach { flagImage in
            flagImage.image = UIImage(named: "flag")
        }
    }
}
