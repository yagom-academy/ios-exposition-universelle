//
//  ExpoViewController.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/05.
//

import UIKit

final class ExpoViewController: UIViewController {
    @IBOutlet weak var expoTitle: UILabel!
    @IBOutlet weak var expoImage: UIImageView!
    @IBOutlet weak var visitors: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var koreaItemsPageButton: UIButton!
    @IBOutlet weak var koreaImageLeft: UIImageView!
    @IBOutlet weak var koreaImageRight: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    private var expoData: Expo?

    override func viewDidLoad() {
        do {
            try initExpoData()
            try initUI()
            setLableAttribute()
        } catch {
            alterError(error)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func touchUpMoveToKoreaitems(_ sender: Any) {
        let koreaEntryViewController = KoreaEntryViewController()
        self.navigationController?.pushViewController(koreaEntryViewController, animated: true)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func initExpoData() throws {
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: expoVariable.expoJson) else {
            throw ExpoError.expoData
        }
        self.expoData = try JSONDecoder().decode(Expo.self, from: dataAsset.data)
    }
    
    private func initUI() throws {
        guard let expo = expoData else {
            throw ExpoError.expoData
        }
        self.navigationItem.title = expoVariable.pageTitle
        
        expoTitle.text = expo.title.replacingOccurrences(of: "(", with: "\n(")
        expoImage.image = UIImage(named: expoVariable.expoImageName)
        visitors.text = PreFixWord.visitor + creatVisitorsComma(expo.visitors)
        location.text = PreFixWord.location + expo.location
        duration.text = PreFixWord.duration + expo.duration
        desc.text = expo.description
        
        koreaItemsPageButton.setTitle(expoVariable.koreaEntryButtonTitle, for: .normal)
        koreaImageLeft.image = UIImage(named: expoVariable.TaegeukgiImage)
        koreaImageRight.image = UIImage(named: expoVariable.TaegeukgiImage)
        backgroundImage.image = UIImage(named: expoVariable.expoImageName)
    }
    
    private func creatVisitorsComma(_ visitors: UInt) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let decimalStyleValue = numberFormatter.string(from: NSNumber(value: Int(visitors))) else {
            return ""
        }
        return decimalStyleValue + " 명"
    }

    private func setLableAttribute() {
        expoTitle.font = UIFont.boldSystemFont(ofSize: 30)
        expoTitle.numberOfLines = 2
        expoTitle.lineBreakMode = .byWordWrapping
        expoTitle.textAlignment = .center
        
        desc.font = UIFont.systemFont(ofSize: 16)
        desc.numberOfLines = 0
        desc.lineBreakMode = .byCharWrapping
        desc.textAlignment = .justified
        
        backgroundImage.alpha = 0.15
        self.view.sendSubviewToBack(backgroundImage)
    }
}
