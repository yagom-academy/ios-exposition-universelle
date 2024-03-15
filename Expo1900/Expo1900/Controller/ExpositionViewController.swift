//
//  Expo1900 - ExpositionViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpositionViewController: UIViewController, ExpositionViewDelegate {
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backButtonTitle = "메인"
        
        guard let expositionView = self.view as? ExpositionView else { return }
        expositionView.delegate = self
        
        guard let exposition = JSONDecoder().decode(from: "exposition_universelle_1900", to: ExpositionDTO.self)?.toExposition() else { return }
        
        expositionView.updateComponents(with: exposition)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        appDelegate?.isRotationLocked = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        appDelegate?.isRotationLocked = false
    }
    
    func moveToKoreanEntry() {
        guard let entriesTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "EntriesTableViewController") as? EntriesTableViewController else { return }
        
        self.navigationController?.pushViewController(entriesTableViewController, animated: true)
    }
}
