//
//  Expo1900 - ExhibitionMainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExhibitionMainViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var visitorDetailLabel: UILabel!
    @IBOutlet weak var locationDetailLabel: UILabel!
    @IBOutlet weak var termDetailLabel: UILabel!
    @IBOutlet weak var descTextView: UITextView!
    
    @IBOutlet weak var leftFlagImageView: UIImageView!
    @IBOutlet weak var rightFlagImageView: UIImageView!
    
    var expositionPoster: ExpositionPoster?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpJSONMainData()
        setUpPosterData()
    }
    
    func setUpJSONMainData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            expositionPoster = try jsonDecoder.decode(ExpositionPoster.self, from: dataAsset.data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func setUpPosterData() {
        titleLabel.text = expositionPoster?.title
        imageView.image = UIImage(named: "poster")
        visitorLabel.text = "방문객:"
        visitorDetailLabel.text = "\(formatNumber(number: expositionPoster?.visitors ?? 0)) 명"
        locationLabel.text = "개최지:"
        locationDetailLabel.text = expositionPoster?.location
        termLabel.text = "개최 기간:"
        descTextView.text = expositionPoster?.description
        leftFlagImageView.image = UIImage(named: "flag")
        rightFlagImageView.image = UIImage(named: "flag")
    }
    
    func formatNumber(number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        guard let string = formatter.string(for: number) else {
            return "Error in Formatter"
        }
        
        return string
    }


}

