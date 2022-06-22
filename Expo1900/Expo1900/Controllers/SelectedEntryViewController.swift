//
//  SelectedEntryViewController.swift
//  Expo1900
//
//  Created by Kay on 2022/06/17.
//

import UIKit

class SelectedEntryViewController: UIViewController, ViewControllerNameIdentifying {
    @IBOutlet private weak var selectedEntryImageView: UIImageView!
    @IBOutlet private weak var selectedEntryDescriptionLabel: UILabel!
    
    var entry: ExpositionEntry?
}

extension SelectedEntryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }

    private func configureView() {
        navigationItem.title = entry?.name
        selectedEntryImageView.image = entry?.thumbnail
        selectedEntryDescriptionLabel.text = entry?.description
    }
}
