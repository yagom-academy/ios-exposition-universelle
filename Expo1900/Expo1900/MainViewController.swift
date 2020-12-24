//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var expositionName: UILabel!
    @IBOutlet weak var expositionPoster: UIImageView!
    @IBOutlet weak var numberOfVisitor: UILabel!
    @IBOutlet weak var expositionPlace: UILabel!
    @IBOutlet weak var expositionDuration: UILabel!
    @IBOutlet weak var expositionDescription: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expositionDescription.isEditable = false
        expositionDescription.isScrollEnabled = false

        decodeExpositionData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "메인"
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func decodeExpositionData() {
        let assetFile: String = "exposition_universelle_1900"
        guard let asset = NSDataAsset(name: assetFile) else {
            fatalError("Can not found data asset.")
        }
        
        do {
            let dataModel = try JSONDecoder().decode(ExpositionInformation.self, from: asset.data)
            updateUIFields(with: dataModel)
        } catch {
            print("error: \(error)")
        }
    }
    
    private func updateUIFields(with model: ExpositionInformation) {
        expositionName.text = model.title
        expositionPoster.image = #imageLiteral(resourceName: "poster")
    
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSize = 3
        numberFormatter.numberStyle = .decimal
        guard let visitor = numberFormatter.string(for: model.visitors) else { return }
        numberOfVisitor.text = "방문객 : \(visitor) 명"

        expositionPlace.text = "개최지 : \(model.location)"
        expositionDuration.text = "개최 기간 : \(model.duration)"
        expositionDescription.text = model.description

        nextButton.setTitle("한국의 출품작 보러가기", for: .normal)
    }
}


