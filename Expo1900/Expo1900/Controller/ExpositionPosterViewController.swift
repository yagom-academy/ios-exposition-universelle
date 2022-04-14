//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionPosterViewController: UIViewController {
    
    @IBOutlet weak var visitors: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var duration: UILabel!
    
    @IBOutlet weak var posterTitle: UILabel!
    @IBOutlet weak var visitorsValue: UILabel!
    @IBOutlet weak var locationValue: UILabel!
    @IBOutlet weak var durationValue: UILabel!
    @IBOutlet weak var descriptions: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPoster()
    }
    
    func setupPoster() {
        let poster = ExpositionPoster.parse(JsonFile.poster)
        
        visitors.text = Poster.visitors
        location.text = Poster.location
        duration.text = Poster.durationn
        
        posterTitle.text = poster?.title
        visitorsValue.text = poster?.visitors?.description
        locationValue.text = poster?.location
        durationValue.text = poster?.duration
        descriptions.text = poster?.description
    }
}
