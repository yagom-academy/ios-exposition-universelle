//
//  Expo1900 - InformationViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class InformationViewController: UIViewController {
    var information: Exposition?
    
    @IBOutlet weak var titleOfExposition: UILabel!
    @IBOutlet weak var numberOfVisitors: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var descriptionOfExposition: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let expositionAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            information = try jsonDecoder.decode(Exposition.self, from: expositionAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        configureLables()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationItem.backButtonTitle = "메인"
    }
    
    func configureLables() {
        titleOfExposition.text = information?.title
        numberOfVisitors.attributedText = attributedString(information?.numberOfVisitors)
        location.attributedText = attributedString(information?.location)
        duration.attributedText = attributedString(information?.duration)
        descriptionOfExposition.text = information?.description
    }
    
    private func attributedString(_ text: String?) -> NSMutableAttributedString? {
        guard let text = text,
              let leftText = text.split(separator: ":").first else {
            return nil
        }
        let leftFont: UIFont = UIFont.systemFont(ofSize: 20)
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.font, value: leftFont, range: NSRange(location: 0, length: leftText.count))
        return attributedString
    }
}
