//
//  Expo1900 - ExpoViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by MARY, KOBE.

import UIKit

final class ExpoViewController: UIViewController {
	private let expoModel: ExpoModel? = {
		guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
			return nil
		}
		let decoder = JSONDecoder()
		let expo = try? decoder.decode(ExpoModel.self, from: dataAsset.data)
		return expo
	}()
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var visitorsLabel: UILabel!
	@IBOutlet weak var locationLabel: UILabel!
	@IBOutlet weak var durationLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
    }

	private func setUpLabels() {
		guard let expoModel = expoModel,
			  let visitors = expoModel.visitors.changeToString() else {
			return
		}
		titleLabel.text = expoModel.title.replacingOccurrences(of: "(", with: "\n(")
		visitorsLabel.text = "방문객 : \(visitors) 명"
		locationLabel.text = "개최지 : \(expoModel.location)"
		durationLabel.text = "개최 기간 : \(expoModel.duration)"
		descriptionLabel.text = expoModel.description
	}
}

