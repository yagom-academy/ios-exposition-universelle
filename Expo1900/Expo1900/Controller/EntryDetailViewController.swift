//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by Baek on 2022/06/16.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    private var expositionDetailView: EntryDetailView?
    var entryEntity: EntryEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

extension EntryDetailViewController {
    private func configureUI() {
        if let entryEntity = entryEntity {
            expositionDetailView = EntryDetailView(self.view, data: entryEntity)
            self.title = entryEntity.name
        }
    }
}
