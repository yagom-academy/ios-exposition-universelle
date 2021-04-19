//
//  EntryWorkDetailViewController.swift
//  Expo1900
//
//  Created by 배은서 on 2021/04/12.
//

import UIKit

final class EntryWorkDetailViewController: UIViewController {
    
    @IBOutlet private weak var entryWorkImageView: UIImageView!
    @IBOutlet private weak var entryWorkDescriptionLabel: UILabel!
    
    var entryWorkItem: EntryWorkItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(entryWorkItem)
    }
    
    private func updateUI(_ item: EntryWorkItem?) {
        self.navigationItem.title = item?.name
        guard let imageName = item?.imageName else { return }
        entryWorkImageView.image = UIImage(named: imageName)
        entryWorkDescriptionLabel.text = item?.description
    }
}
