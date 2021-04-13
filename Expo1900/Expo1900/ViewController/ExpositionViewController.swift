//
//  ExpositionViewController.swift
//  Expo1900
//
//  Created by 이영우 on 2021/04/12.
//

import UIKit

final class ExpositionViewController: UIViewController {

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
        self.navigationItem.title = ExpositionConstant.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func decodeExpoData() {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: ExpositionConstant.expoJson, bundle: .main) else {
            return
        }
        do {
            self.expoData = try JSONDecoder().decode(Exposition.self, from: dataAsset.data)
        } catch {
            implementErrorAlert(ExpoError.invalidExpoData)
        }
    }
    
    private func initializeViews() {
        guard let data = expoData else {
            return
        }
        titleLabel.text = data.title.replacingOccurrences(of: "(", with: "\n(")
        visitorsLabel.text = PrePhraseInLabel.visitors + data.visitorsStringFormat
        locationLabel.text = PrePhraseInLabel.location + data.location
        durationLabel.text = PrePhraseInLabel.duration + data.duration
        descriptionLabel.text = data.description
        posterImageView.image = UIImage(named: ExpositionConstant.posterImage)
        itemsListPageButton.setTitle(ExpositionConstant.listPageButtonTitle, for: .normal)
        leftOnButtonImageView.image = UIImage(named: ExpositionConstant.flagImage)
        rightOnButtonImageView.image = UIImage(named: ExpositionConstant.flagImage)
    }
    
    private func setTitleLabelAttribute() {
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        descriptionLabel.numberOfLines = 0
    }
    
    @IBAction private func pushItemsListPageButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: ExpositionConstant.koreaItemListPageIdentifier)
        self.navigationController?.pushViewController(viewController, animated: false)
    }
}

extension ExpositionViewController {
    enum ExpositionConstant {
        static let expoJson = "exposition_universelle_1900"
        static let title = "메인"
        static let posterImage = "poster"
        static let flagImage = "flag"
        static let listPageButtonTitle = "한국의 출품작 보러가기"
        static let koreaItemListPageIdentifier = "KoreanItemsListVC"
    }
    
    enum PrePhraseInLabel {
        static let visitors = "방문객 : "
        static let location = "개최지 : "
        static let duration = "개최 기간: "
    }
}
