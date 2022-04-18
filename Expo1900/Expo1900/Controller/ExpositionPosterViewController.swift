//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

enum PosterLetter {
    static let visitors = "방문객 :"
    static let location = "개최지 :"
    static let duration = "개최 기간 :"
    static let numberOfPeople = " 명"
    static let main = "메인"
    static let entryListViewController = "EntryListViewController"
}

final class ExpositionPosterViewController: UIViewController {
    
    private var poster: ExpositionPoster? {
        didSet {
            updatePoster()
        }
    }
    
    @IBOutlet private weak var visitors: UILabel!
    @IBOutlet private weak var location: UILabel!
    @IBOutlet private weak var duration: UILabel!
    
    @IBOutlet private weak var posterTitle: UILabel!
    @IBOutlet private weak var visitorsValue: UILabel!
    @IBOutlet private weak var locationValue: UILabel!
    @IBOutlet private weak var durationValue: UILabel!
    @IBOutlet private weak var descriptions: UILabel!
    
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
        guard let entryListViewController = self.storyboard?.instantiateViewController(withIdentifier: PosterLetter.entryListViewController) else { return }
        self.navigationController?.pushViewController(entryListViewController, animated: true)
    }
    
    private func setupPoster() {
        navigationItem.backButtonTitle = PosterLetter.main
        
        visitors.text = PosterLetter.visitors
        location.text = PosterLetter.location
        duration.text = PosterLetter.duration
    }
    
    private func updatePoster() {
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
        
        return result + PosterLetter.numberOfPeople
    }
}
