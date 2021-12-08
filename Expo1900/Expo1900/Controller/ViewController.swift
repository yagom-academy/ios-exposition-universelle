//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var exposition: Exposition = Exposition()
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private var flagImages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        updateUI()
    }
    
    func fetchData() {
        do {
            exposition = try JSONParser<Exposition>.decode(fileName: "exposition_universelle_1900")
        } catch {
            print(error)
        }
    }
    
    func updateUI() {
        titleLabel.text = exposition.title
        visitorsLabel.text = ": \(exposition.visitors.formattedString) 명"
        locationLabel.text = ": \(exposition.location)"
        durationLabel.text = ": \(exposition.duration)"
        descriptionTextView.text = exposition.description
        
        posterImage.image = UIImage(named: "poster")
        flagImages.forEach { $0.image = UIImage(named: "flag") }
    }
}
