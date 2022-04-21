//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

enum PosterLetter {
    static let visitors = "방문객"
    static let location = "개최지"
    static let duration = "개최 기간"
    static let numberOfPeople = " 명"
    static let main = "메인"
    static let entryListViewController = "EntryListViewController"
}

final class ExpositionPosterViewController: UIViewController {
    
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    private var poster: ExpositionPoster? {
        didSet {
            updatePoster()
        }
    }
    
    @IBOutlet private weak var posterTitle: UILabel!
    @IBOutlet private weak var visitorsValue: UILabel!
    @IBOutlet private weak var locationValue: UILabel!
    @IBOutlet private weak var durationValue: UILabel!
    @IBOutlet private weak var descriptions: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPosterView()
    }
    
    private func setUpPosterView() {
        navigationItem.backButtonTitle = PosterLetter.main
        poster = ExpositionPoster.parse(JsonFile.poster)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        appDelegate?.shouldSupporAllOrientation = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        appDelegate?.shouldSupporAllOrientation = true
    }
    
    @IBAction func didTapKoreaEntriesList(_ sender: UIButton) {
        guard let entryListViewController = self.storyboard?.instantiateViewController(withIdentifier: PosterLetter.entryListViewController) else { return }
        self.navigationController?.pushViewController(entryListViewController, animated: true)
    }
    
    private func updatePoster() {
        posterTitle.text = poster?.title?.replacingOccurrences(of: "(", with: "\n(")
        posterTitle.changeFont(to: .title1, letter: posterTitle.text)
        
        visitorsValue.text = "\(PosterLetter.visitors) : \(poster?.visitors?.numberFormatter() ?? "")"
        visitorsValue.changeFont(to: .title3, letter: PosterLetter.visitors)
        
        locationValue.text = "\(PosterLetter.location) : \(poster?.location ?? "")"
        locationValue.changeFont(to: .title3, letter: PosterLetter.location)
        
        durationValue.text = "\(PosterLetter.duration) : \(poster?.duration ?? "")"
        durationValue.changeFont(to: .title3, letter: PosterLetter.duration)
        
        descriptions.text = poster?.description
        }
    }
