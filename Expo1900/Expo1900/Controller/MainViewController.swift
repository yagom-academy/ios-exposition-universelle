//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var viewKoreaEnrtyListButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadExpositionInformation()
    }

    func loadExpositionInformation() {
        do {
            try insertDataToView()
            
        } catch ExpositionError.failJSONParsing {
            print(ExpositionError.failJSONParsing)
        } catch ExpositionError.failTypeCasting {
            print(ExpositionError.failTypeCasting)
        } catch ExpositionError.notExistData {
            print(ExpositionError.notExistData)
        } catch {
            print(error)
        }
    }

    func insertDataToView() throws {
        guard let expositionData = try parseExpositionJSON() else {
            throw ExpositionError.failJSONParsing
        }
        
        let visitorsCount = try insertComma(at: expositionData.visitorsCount)
        
        titleLabel.text = expositionData.title
        visitorsCountLabel.text = "방문객 : \(visitorsCount)"
        locationLabel.text = "개최지 : \(expositionData.location)"
        durationLabel.text = "개최기간 : \(expositionData.duration)"
        descriptionTextView.text = expositionData.description
    }
    
    func insertComma(at value: Int) throws -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let insertedCommaValue = numberFormatter.string(from: NSNumber(value: value)) else {
            throw ExpositionError.failTypeCasting
        }
    
        return insertedCommaValue
    }
}

