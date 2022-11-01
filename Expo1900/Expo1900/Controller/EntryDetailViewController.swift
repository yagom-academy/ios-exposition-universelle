//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by Hamo, Mene on 2022/10/19.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    @IBOutlet private weak var entryImageView: UIImageView!
    @IBOutlet private weak var entryDetailLabel: UILabel!
    
    private let entryInformation: ExhibitionEntry
    
    init?(entryInformation: ExhibitionEntry, coder: NSCoder) {
        self.entryInformation = entryInformation
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        entryImageView.image = UIImage(named: entryInformation.imageName)
        entryDetailLabel.text = entryInformation.description
        navigationItem.title = entryInformation.name
    }
}
