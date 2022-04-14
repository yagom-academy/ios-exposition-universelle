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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func didTapKoreaEntriesList(_ sender: UIButton) {
        if let entryListViewController = self.storyboard?.instantiateViewController(withIdentifier: "EntryListViewController") {
            entryListViewController.navigationItem.title = "한국의 출품작"
            self.navigationController?.pushViewController(entryListViewController, animated: true)
        }
    }
    
    func setupPoster() {
        navigationItem.backButtonTitle = "메인"
        
        let poster = ExpositionPoster.parse(JsonFile.poster)
        
        visitors.text = Poster.visitors
        location.text = Poster.location
        duration.text = Poster.duration
        
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
        
        return result + Poster.numberOfPeople
    }
}
