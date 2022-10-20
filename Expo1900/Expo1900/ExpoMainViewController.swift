//
//  Expo1900 - ViewController.swift
//  Created by sunnyCookie, Wonbi
// 

import UIKit

final class ExpoMainViewController: UIViewController {
    private var expoInformation: ExpoInformation?
    
    @IBOutlet weak private var titleLabel: UILabel!
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
        buildExpoMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        buildNavigationBar()
    }
    
    private func buildNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        title = "메인"
    }
    
    private func buildExpoMainView() {
        guard let expoInformation = expoInformation else { return }
        
        titleLabel.text = expoInformation.mainTitle
        titleLabel.numberOfLines = 0
        titleLabel.font = .preferredFont(forTextStyle: .title1)
        titleLabel.textAlignment = .center

        posterImage.image = UIImage(named: "poster")
        
        visitorLabel.text = "\(expoInformation.decimalVisitor) 명"
        
        localeLabel.text = expoInformation.location
        
        periodLabel.text = expoInformation.duration
        
        descriptionTextView.text = expoInformation.description
        descriptionTextView.font = .preferredFont(forTextStyle: .body)
        
        flagImages.forEach { flagImage in
            flagImage.image = UIImage(named: "flag")
        }
    }
    
    @IBAction func tapEntryButton(_ sender: UIButton) {
        guard let entryViewController = storyboard?.instantiateViewController(
            withIdentifier: "EntryViewController"
        ) as? EntryViewController else { return }
        
        navigationController?.pushViewController(entryViewController, animated: true)
    }
}
