//
//  SelectedEntryViewController.swift
//  Expo1900
//
//  Created by Kay on 2022/06/17.
//

import UIKit

final class SelectedEntryViewController: UIViewController, ViewControllerNameIdentifying {
    @IBOutlet private weak var selectedEntryImageView: UIImageView!
    @IBOutlet private weak var selectedEntryDescriptionLabel: UILabel!
    
    var entry: ExpositionEntry?
}

extension SelectedEntryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureData()
        configureNavigationBar()
    }

    private func configureData() {
        navigationItem.title = entry?.name
        selectedEntryImageView.image = entry?.thumbnail
        selectedEntryDescriptionLabel.text = entry?.description
    }
    
    private func configureNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
    }
}
