//
//  ExpositionDetailViewController.swift
//  Expo1900
//
//  Created by Baek on 2022/06/16.
//

import UIKit

final class ExpositionDetailViewController: UIViewController {
    private var expositionDetailView: ExpositionDetailView?
    var entryEntity: EntryEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

extension ExpositionDetailViewController {
    private func configureUI() {
        if let entryEntity = entryEntity {
            expositionDetailView = ExpositionDetailView(self.view, data: entryEntity)
            self.title = entryEntity.name
        }
    }
}
