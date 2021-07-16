//
//  ExpositionInformationViewController.swift
//  Expo1900
//
//  Created by KimJaeYoun on 2021/07/13.
//

import UIKit

class ExpositionInformationViewController: UIViewController {
    
    private let expositionInformationManager = ExpositionInformationManager()
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let resultData = try expositionInformationManager.decodejsonData()
            setUpLabels(to: resultData)
        } catch let error as JsonDataFetchError {
            let alert = UIAlertController(title: error.description.title, message: error.description.message, preferredStyle: .alert)
            alert.addAction(UIAlertAction.ActionType.ok.action())
            self.present(alert, animated: true, completion: nil)
        } catch {
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setUpLabels(to item: ExpositionInformation) {
        titleLabel.text = item.formattedTitle
        visitorsLabel.text = item.formattedVisitors
        locationLabel.text = item.location
        durationLabel.text = item.duration
        descriptionLabel.text = item.description
    }
}
