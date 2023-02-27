//
//  Expo1900 - ExpositionViewController.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ExpositionViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NameSpace.homeViewTitle
        
        configureLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureLabel() {
        let expositionUniverselle = decodeJson()
        
        titleLabel.text = expositionUniverselle.title
        visitorCountLabel.text = NameSpace.leftVisitorCountString
        + String(expositionUniverselle.visitorCount) + NameSpace.rightVisitorCountString
        locationLabel.text = NameSpace.leftLocationString + expositionUniverselle.location
        durationLabel.text = NameSpace.leftDurationString + expositionUniverselle.duration
        descriptionLabel.text = expositionUniverselle.description
    }
    
    private func decodeJson() -> ExpositionUniverselle {
        let decoder: JSONDecoder = JSONDecoder()
        let emptyData: ExpositionUniverselle = .init(title: NameSpace.emptyString, visitorCount: Int.zero, location: NameSpace.emptyString, duration: NameSpace.emptyString, description: NameSpace.emptyString)
        
        guard let expositionUniverselle: NSDataAsset  = NSDataAsset(name: "exposition_universelle_1900") else { return emptyData }
        
        guard let decodedExpositionUniverselle: ExpositionUniverselle = try? decoder.decode(ExpositionUniverselle.self, from: expositionUniverselle.data) else { return emptyData }
        
        return decodedExpositionUniverselle
    }
    
    @IBAction func touchUpInsideItemButton(_ sender: UIButton) {
        guard let itemsView: ItemsViewController = self.storyboard?.instantiateViewController(withIdentifier: "itemViewController") as? ItemsViewController else { return }
        
        navigationController?.pushViewController(itemsView, animated: true)
    }
}
