//
//  Expo1900 - ViewController.swift
//  Created by sunnyCookie, Wonbi
// 

import UIKit

final class ExpoMainViewController: UIViewController {
    private let expoInformation: ExpoInformation
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var posterImage: UIImageView!
    @IBOutlet weak private var visitorLabel: UILabel!
    @IBOutlet weak private var localeLabel: UILabel!
    @IBOutlet weak private var periodLabel: UILabel!
    @IBOutlet weak private var descriptionTextView: UITextView!
    @IBOutlet private var flagImages: [UIImageView]!
    
    required init?(coder: NSCoder) {
        guard let expoInformationData = JSONDecoder.decode(
            ExpoInformation.self,
            from: "exposition_universelle_1900"
        ) else { return nil }
        
        expoInformation = expoInformationData
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAttribute()
        buildExpoMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        buildNavigationBar()
        
        let portrait = UIInterfaceOrientation.portrait.rawValue
        let orientation = UIDevice.current.orientation.rawValue
        
        UIDevice.current.setValue(portrait, forKey: "orientation")
        UIDevice.current.setValue(orientation, forKey: "orientation")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let orientation = UIDevice.current.orientation.rawValue
        
        UIDevice.current.setValue(orientation, forKey: "orientation")
    }
    
    @IBAction func tapEntryButton(_ sender: UIButton) {
        guard let entryViewController = storyboard?.instantiateViewController(
            withIdentifier: "EntryViewController"
        ) as? EntryViewController else { return }
        
        navigationController?.pushViewController(entryViewController, animated: true)
    }
}
    
private extension ExpoMainViewController {
    func configureAttribute() {
        titleLabel.numberOfLines = 0
        titleLabel.font = .preferredFont(forTextStyle: .title1)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byWordWrapping
        
        visitorLabel.numberOfLines = 0
        visitorLabel.font = .preferredFont(forTextStyle: .title3)
        visitorLabel.adjustsFontForContentSizeCategory = true
        visitorLabel.lineBreakMode = .byWordWrapping
        
        localeLabel.numberOfLines = 0
        localeLabel.font = .preferredFont(forTextStyle: .title3)
        localeLabel.adjustsFontForContentSizeCategory = true
        localeLabel.lineBreakMode = .byWordWrapping
        
        periodLabel.numberOfLines = 0
        periodLabel.font = .preferredFont(forTextStyle: .title3)
        periodLabel.adjustsFontForContentSizeCategory = true
        periodLabel.lineBreakMode = .byWordWrapping
        
        descriptionTextView.font = .preferredFont(forTextStyle: .body)
        descriptionTextView.adjustsFontForContentSizeCategory = true
        descriptionTextView.textContainer.lineBreakMode = .byWordWrapping
    }
    
    func buildExpoMainView() {
        titleLabel.text = expoInformation.mainTitle
        posterImage.image = UIImage(named: "poster")
        visitorLabel.text = "\(expoInformation.decimalVisitor) 명"
        localeLabel.text = expoInformation.location
        periodLabel.text = expoInformation.duration
        descriptionTextView.attributedText = expoInformation.description.applyHangulAttribute()
        flagImages.forEach { flagImage in
            flagImage.image = UIImage(named: "flag")
        }
    }
    
    func buildNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        title = "메인"
    }
}
