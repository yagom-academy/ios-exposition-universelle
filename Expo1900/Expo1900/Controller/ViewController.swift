//
//  Expo1900 - ViewController.swift
//  Created by 세홍, 송준, 무리
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var pushSecondViewButton: UIButton!
    @IBOutlet var flagImage: [UIImageView]!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var exposition: Exposition = Exposition(title: "", visitors: 0, location: "", duration: "", description: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeData()
        setUpView()
    }
    
    func decodeData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            self.exposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func setUpView() {
        titleLabel.text = exposition.title
        visitorsLabel.text = exposition.visitorLabelText
        locationLabel.text = exposition.locationLabelText
        durationLabel.text = exposition.durationLabelText
        descriptionLabel.text = exposition.description
        descriptionLabel.numberOfLines = 0
        posterImageView.image = UIImage(named: "poster")
        flagImage.forEach { $0.image = UIImage(named: "flag") }
    }
}
