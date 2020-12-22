//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var expositionName: UILabel!
    @IBOutlet weak var expositionPoster: UIImageView!
    
    @IBOutlet weak var numberOfVisitor: UILabel!
    @IBOutlet weak var expositionPlace: UILabel!
    @IBOutlet weak var expositionDuration: UILabel!
    @IBOutlet weak var expositionDescription: UITextView!
    
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        expositionDescription.isEditable = false
        expositionDescription.isScrollEnabled = false

        // MARK:- Decode
        let assetFile: String = "exposition_universelle_1900"
        guard let asset = NSDataAsset(name: assetFile) else {
            fatalError("Can not found data asset.")
        }
        let decoder = JSONDecoder()
        let decodedData = try? decoder.decode(ExpositionInformation.self, from: asset.data)

        // Title
        expositionName.text = decodedData?.title
        // Image
        expositionPoster.image = #imageLiteral(resourceName: "poster")
        // Visitor
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSize = 3
        numberFormatter.numberStyle = .decimal
        guard let visitor = numberFormatter.string(for: decodedData?.visitors) else { return }
        numberOfVisitor.text = "방문객 : \(visitor) 명"
        // Location
        guard let location = decodedData?.location else { return }
        expositionPlace.text = "개최지 : \(location)"
        // Duration
        guard let duration = decodedData?.duration else { return }
        expositionDuration.text = "개최 기간 : \(duration)"
        // Description
        expositionDescription.text = decodedData?.description

        nextButton.setTitle("한국의 출품작 보러가기", for: .normal)
    }
}

