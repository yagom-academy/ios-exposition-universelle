//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var leftFlagImage: UIImageView!
    @IBOutlet private weak var rightFlagImage: UIImageView!
    @IBOutlet private var infoLabels: [UILabel]!
    
    var exposition: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            showDataErrorAlert()
            return
        }
        
        do {
            self.exposition = try JSONDecoder().decode(Exposition.self, from: dataAsset.data)
        } catch {
            showDataErrorAlert()
            printErrorLog()
        }
        
        updateTitleLabel()
        updateLabelText()
        updateImage()
        
        infoLabels.forEach { $0.setDynamicType() }
        descriptionTextView.setDynamicType()
        setAccessibilityLabels()
        
        self.navigationItem.backButtonTitle = "메인"
    }
    
    private func updateTitleLabel() {
        guard var title = exposition?.title,
              let index = title.firstIndex(of: "(") else {
            titleLabel.text = exposition?.title
            return
        }
        
        title.insert("\n", at: index)
        titleLabel.text = title
    }
    
    private func updateLabelText() {
        locationLabel.text = exposition?.location
        durationLabel.text = exposition?.duration
        descriptionTextView.text = exposition?.description
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let exposition = exposition,
              let visitorsText = numberFormatter.string(from: Double(exposition.visitors) as NSNumber) else { return }
        
        visitorsLabel.text = visitorsText + " 명"
    }
    
    private func updateImage() {
        posterImage.image = UIImage(named: "poster")
        
        let flagImage = UIImage(named: "flag")
        leftFlagImage.image = flagImage
        rightFlagImage.image = flagImage
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait]
    }
    
    private func setAccessibilityLabels() {
        titleLabel.accessibilityLabel = "파리 만국박람회 1900"
        
        let parsedDates: [String] = parseDates()
        durationLabel.accessibilityLabel = "\(parsedDates[0])부터 \(parsedDates[1])까지"
    }
    
    private func parseDates() -> [String] {
        guard let duration = exposition?.duration else { return [] }
        let splitDates: [String] = duration
            .split(separator: "-", omittingEmptySubsequences: true)
            .map { String($0) }
        
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy. MM. dd"
            formatter.locale = Locale(identifier: "ko_kr")
            formatter.timeZone = TimeZone(secondsFromGMT: timezone)
            return formatter
        }()
        
        let dateToStringFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy년 MM월 dd일"
            return formatter
        }()

        var parsedDates: [String] = []
        splitDates.forEach {
            guard let date = dateFormatter.date(from: $0) else { return }
            parsedDates.append(dateToStringFormatter.string(from: date))
        }
        
        return parsedDates
    }
    
    @IBAction func tappedShowItemsButton(sender: UIButton) {
        guard let nextViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "itemList") as? ItemListViewController else {
            showTransitionErrorAlert()
            return
        }
        
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
