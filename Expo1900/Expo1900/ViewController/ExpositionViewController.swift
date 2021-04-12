//
//  ExpositionViewController.swift
//  Expo1900
//
//  Created by 이영우 on 2021/04/12.
//

import UIKit

class ExpositionViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var itemsListPageButton: UIButton!
    @IBOutlet private weak var leftOnButtonImageView: UIImageView!
    @IBOutlet private weak var rightOnButtonImageView: UIImageView!
    
    private var expoData: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeExpoData()
        setTitleLabelAttribute()
        initializeViews()
        self.navigationItem.title = "메인"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func decodeExpoData() {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900", bundle: .main) else {
            return
        }
        do {
            self.expoData = try JSONDecoder().decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func initializeViews() {
        guard let data = expoData else {
            return
        }
        titleLabel.text = data.title.replacingOccurrences(of: "(", with: "\n(")
        visitorsLabel.text = "방문객 : \(data.visitorsStringFormat)"
        locationLabel.text = "개최지 : \(data.location)"
        durationLabel.text = "개최 기간 : \(data.duration)"
        descriptionLabel.text = data.description
        posterImageView.image = UIImage(named: "poster")
        itemsListPageButton.setTitle("한국의 출품작 보러가기", for: .normal)
        leftOnButtonImageView.image = UIImage(named: "flag")
        rightOnButtonImageView.image = UIImage(named: "flag")
    }
    
    private func setTitleLabelAttribute() {
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        descriptionLabel.numberOfLines = 0
    }
    
    @IBAction func pushItemsListPageButton(_ sender: UIButton) {
        
    }
}
