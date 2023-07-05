//
//  Expo1900 - ExpoViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by MARY, KOBE.

import UIKit

final class ExpoViewController: UIViewController {
	@IBOutlet private weak var titleLabel: UILabel!
	@IBOutlet private weak var visitorsLabel: UILabel!
	@IBOutlet private weak var locationLabel: UILabel!
	@IBOutlet private weak var durationLabel: UILabel!
	@IBOutlet private weak var descriptionLabel: UILabel!

    private let expoModel: ExpoModel? = try? Decoder.decodeJSON(dataAssetName: JSONDataNameSpace.expoData)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLabels()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
        
        self.title = ViewControllerTitleNameSpace.expo
		navigationController?.setNavigationBarHidden(true, animated: false)
	}

	private func setUpLabels() {
		guard let expoModel = expoModel,
			  let visitors = expoModel.visitors.changeToString() else {
			return
		}
        
		titleLabel.text = expoModel.title.replacingOccurrences(of: "(", with: "\n(")
		visitorsLabel.text = ExpoNameSpace.visitors + visitors + ExpoNameSpace.visitiorsUint
		locationLabel.text = ExpoNameSpace.location + expoModel.location
		durationLabel.text = ExpoNameSpace.duration + expoModel.duration
		descriptionLabel.text = expoModel.description
	}
}

extension ExpoViewController {
	private enum ExpoNameSpace {
		static let visitors: String = "방문객 : "
		static let visitiorsUint: String = " 명"
		static let location: String = "개최지 : "
		static let duration: String = "개최 기간 : "
	}
}
