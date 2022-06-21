//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by Baek on 2022/06/16.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    private var expositionDetailView: EntryDetailView?
    private let entryEntityData: EntryEntity
    
    init(data: EntryEntity) {
        self.entryEntityData = data
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activateOnlyPortraitOrientation(false)
        configureUI()
    }
}

// - MARK: View Settings

extension EntryDetailViewController {
    private func configureUI() {
        expositionDetailView = EntryDetailView(self.view, data: entryEntityData)
        self.title = entryEntityData.name
    }
}
