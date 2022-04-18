//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpositionPosterViewController: UIViewController {
    
    private var poster: ExpositionPoster? {
        didSet {
            posterUpdate()
        }
    }
    
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
        poster = ExpositionPoster.parse(JsonFile.poster)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func didTapKoreaEntriesList(_ sender: UIButton) {
        if let entryListViewController = self.storyboard?.instantiateViewController(withIdentifier: Exposition.entryListViewController) {
            entryListViewController.navigationItem.title = Exposition.koreaEntryList
            self.navigationController?.pushViewController(entryListViewController, animated: true)
        }
    }
    
    private func setupPoster() {
        navigationItem.backButtonTitle = Exposition.main
        
        visitors.text = Exposition.visitors
        location.text = Exposition.location
        duration.text = Exposition.duration
    }
    
    private func posterUpdate() {
        posterTitle.text = poster?.title
        visitorsValue.text = numberFormatter(by: poster?.visitors)
        locationValue.text = poster?.location
        durationValue.text = poster?.duration
        descriptions.text = poster?.description
    }
    
    private func numberFormatter(by inputText: Int?) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let result = numberFormatter.string(for: inputText) else {
            return nil
        }
        
        return result + Exposition.numberOfPeople
    }
}
