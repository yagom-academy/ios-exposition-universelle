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
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private var flagImages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupUI()
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
        descriptionLabel.text = exposition.description
        
        posterImage.image = UIImage(named: "poster")
        flagImages.forEach { $0.image = UIImage(named: "flag") }
    }
    
    private func setupUI() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakStrategy = .hangulWordPriority
        flagImages.forEach { $0.contentMode = .scaleAspectFit }
    }
}

extension ViewController {
    @IBAction func touchUpPushExpositionItemTableButton(_ sender: UIButton) {
        let expositionItemTableStoryboard = UIStoryboard(name: "ExpositionItemTable", bundle: nil)
        
        let expositionItemTableViewController = expositionItemTableStoryboard.instantiateViewController(withIdentifier: "ExpositionItemTable")
        
        self.navigationController?.pushViewController(expositionItemTableViewController, animated: true)
    }
}
