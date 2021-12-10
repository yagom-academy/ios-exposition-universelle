//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    // MARK: - Properties
    private var exposition: Exposition = Exposition()
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private var flagImages: [UIImageView]!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupUI()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Methods
    private func fetchData() {
        do {
            exposition = try JSONParser<Exposition>.decode(fileName: FileName.exposition)
        } catch {
            print(error)
        }
    }
    
    private func setupUI() {
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakStrategy = .hangulWordPriority
        
        flagImages.forEach { $0.contentMode = .scaleAspectFit }
    }
    
    private func updateUI() {
        self.title = "메인"
        
        titleLabel.text = exposition.title
        visitorsLabel.text = ": \(exposition.visitors.formattedString) 명"
        locationLabel.text = ": \(exposition.location)"
        durationLabel.text = ": \(exposition.duration)"
        descriptionLabel.text = exposition.description
        
        posterImage.image = UIImage(named: FileName.poster)
        flagImages.forEach { $0.image = UIImage(named: FileName.flag) }
    }
}

// MARK: - IBAction
extension ExpositionViewController {
    @IBAction private func touchUpPushExpositionItemTableButton(_ sender: UIButton) {
        let expositionItemTableStoryboard = UIStoryboard(name: "ExpositionItemTable", bundle: nil)
        
        let expositionItemTableViewController = expositionItemTableStoryboard.instantiateViewController(withIdentifier: "ExpositionItemTable")
        
        self.navigationController?.pushViewController(expositionItemTableViewController, animated: true)
    }
}
