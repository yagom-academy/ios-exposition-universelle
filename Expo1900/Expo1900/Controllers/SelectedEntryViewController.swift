//
//  SelectedEntryViewController.swift
//  Expo1900
//
//  Created by Kay on 2022/06/17.
//

import UIKit

class SelectedEntryViewController: UIViewController {
    @IBOutlet weak var selectedEntryImageView: UIImageView!
    @IBOutlet weak var selectedEntryDescriptionLabel: UILabel!
    
    var entry: ExpositionEntry?
}

extension SelectedEntryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

extension SelectedEntryViewController {
    private func configureView() {
        navigationItem.title = entry?.name
        selectedEntryImageView.image = entry?.thumbnail
        selectedEntryDescriptionLabel.text = entry?.description
    }
}
