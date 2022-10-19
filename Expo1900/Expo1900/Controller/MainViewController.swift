//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var leftFlagImage: UIImageView!
    @IBOutlet private weak var rightFlagImage: UIImageView!
    
    var exposition: Exposition?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            self.exposition = try JSONDecoder().decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error)
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let exposition = exposition,
              let visitorsText = numberFormatter.string(from: Double(exposition.visitors) as NSNumber) else { return }

        updateTitleLabel()
        posterImage.image = UIImage(named: "poster")
        visitorsLabel.text = visitorsText + " 명"
        locationLabel.text = exposition.location
        durationLabel.text = exposition.duration
        descriptionTextView.text = exposition.description
        
        leftFlagImage.image = UIImage(named: "flag")
        rightFlagImage.image = UIImage(named: "flag")
        self.navigationItem.backButtonTitle = "메인"
    }
    
    func updateTitleLabel() {
        guard var title = exposition?.title,
        let index = title.firstIndex(of: "(") else { return }
        
        title.insert("\n", at: index)
        titleLabel.text = title
        
    }
    
    @IBAction func tappedShowItemsButton(sender: UIButton) {
        guard let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "koreanItems") as? KoreanItemViewController else { return }
        
        nextViewController.title = "한국의 출품작"
        navigationController?.pushViewController(nextViewController, animated: true)
    }

}

