//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var leftFlagImage: UIImageView!
    @IBOutlet private weak var rightFlagImage: UIImageView!
    @IBOutlet private var infoLabels: [UILabel]!
    
    var exposition: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            showDataErrorAlert()
            return
        }
        
        do {
            self.exposition = try JSONDecoder().decode(Exposition.self, from: dataAsset.data)
        } catch {
            showDataErrorAlert()
            printErrorLog()
        }
        
        updateTitleLabel()
        updateLabelText()
        updateImage()
        
        infoLabels.forEach { $0.setDynamicType() }
        descriptionTextView.setDynamicType()
        self.navigationItem.backButtonTitle = "메인"
    }
    
    func updateTitleLabel() {
        guard var title = exposition?.title,
              let index = title.firstIndex(of: "(") else {
            titleLabel.text = exposition?.title
            return
        }
        
        title.insert("\n", at: index)
        titleLabel.text = title
    }
    
    func updateLabelText() {
        locationLabel.text = exposition?.location
        durationLabel.text = exposition?.duration
        descriptionTextView.text = exposition?.description
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let exposition = exposition,
              let visitorsText = numberFormatter.string(from: Double(exposition.visitors) as NSNumber) else { return }
        
        visitorsLabel.text = visitorsText + " 명"
    }
    
    func updateImage() {
        posterImage.image = UIImage(named: "poster")
        
        let flagImage = UIImage(named: "flag")
        leftFlagImage.image = flagImage
        rightFlagImage.image = flagImage
    }
    
    @IBAction func tappedShowItemsButton(sender: UIButton) {
        guard let nextViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "itemList") as? ItemListViewController else {
            showTransitionErrorAlert()
            return
        }
        
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait]
    }
}
