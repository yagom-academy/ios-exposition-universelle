//
//  ExpositionItemViewController.swift
//  Expo1900
//
//  Created by 이차민 on 2021/12/09.
//

import UIKit

class ExpositionItemViewController: UIViewController {
    // MARK: - Properties
    private var expositionItem: ExpositionItem?
    
    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var itemDescriptionLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }
    
    // MARK: - Initializer
    init?(coder: NSCoder, expositionItem: ExpositionItem) {
        self.expositionItem = expositionItem
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Methods
    private func setupUI() {
        itemDescriptionLabel.numberOfLines = 0
        itemDescriptionLabel.lineBreakStrategy = .hangulWordPriority
        itemImage.contentMode = .scaleAspectFit
    }
    
    private func updateUI() {
        guard let expositionItem = expositionItem else {
            return
        }
        
        self.title = expositionItem.name
        itemImage.image = UIImage(named: expositionItem.imageName)
        itemDescriptionLabel.text = expositionItem.description
    }
}
