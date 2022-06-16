//
//  ExpositionDetailViewController.swift
//  Expo1900
//
//  Created by Baek on 2022/06/16.
//

import UIKit

final class ExpositionDetailViewController: UIViewController {
    var entryEntity: EntryEntity?
    private var expositionDetailView: ExpositionDetailView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        if let entryEntity = entryEntity {
            expositionDetailView = ExpositionDetailView(self.view, data: entryEntity)
            self.title = entryEntity.name
        }
    }
}
