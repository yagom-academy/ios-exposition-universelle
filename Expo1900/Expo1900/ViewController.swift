//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var goKoreaExpoListButton: UIButton!
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "메인"
        decodeData()
        setLabelFontStyle()
        setLabelFontSizeToFitWidth()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    private func decodeData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            showAlert(message: ExpositionError.canNotDecodeData.localizedDescription)
            return
        }
        do {
            let result = try jsonDecoder.decode(ParisExpositionInformation.self, from: dataAsset.data)
            setAllLabelsInView(from: result)
        } catch ExpositionError.canNotDecodeData {
            showAlert(message: ExpositionError.canNotDecodeData.localizedDescription)
        } catch {
            showAlert(message: ExpositionError.unknownError.localizedDescription)
        }
    }
    
    private func setAllLabelsInView(from result: ParisExpositionInformation) {
        setTitleLabel(result.title)
        setVisitorsLabel(result.visitors)
        let locationLabelPrefix = "개최지 : "
        locationLabel.text = setLabel(from: result.location, prefix: locationLabelPrefix)
        let durationLabelPrefix = "개최 기간 : "
        durationLabel.text = setLabel(from: result.duration, prefix: durationLabelPrefix)
        descriptionLabel.text = result.description
    }
    
    private func setTitleLabel(_ title: String) {
        var seperatedTitle = title.components(separatedBy: "(")
        seperatedTitle.insert("\n(", at: 1)
        var resultTitle: String = ""
        for text in seperatedTitle {
            resultTitle += text
        }
        titleLabel.text = resultTitle
    }
    
    private func setVisitorsLabel(_ visitors: UInt) {
        let prefix = "방문자 : "
        let number = "\(visitors) 명"
        let text = setLabel(from: number, prefix: prefix)
        visitorsLabel.text = text
    }
    
    private func setLabel(from labelContent: String, prefix: String) -> String {
        let text = "\(prefix)\(labelContent)"
        return text
    }
    
    @IBAction private func touchUpKoreanExpositionItem() {
        guard let koreaExpositionListViewController = self.storyboard?.instantiateViewController(identifier: "KoreaExpositionList") else {
            showAlert(message: ExpositionError.canNotLoadView.localizedDescription)
            return
        }
        self.navigationController?.pushViewController(koreaExpositionListViewController, animated: true)
    }
}

extension ViewController: DynamicTypeable {
    func setLabelFontStyle() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        visitorsLabel.font = UIFont.preferredFont(forTextStyle: .body)
        durationLabel.font = UIFont.preferredFont(forTextStyle: .body)
        locationLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        goKoreaExpoListButton?.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
    }
    
    func setLabelFontSizeToFitWidth() {
        goKoreaExpoListButton?.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
