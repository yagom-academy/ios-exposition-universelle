//
//  ExpositionItemViewController.swift
//  Expo1900
//
//  Created by 이차민 on 2021/12/09.
//

import UIKit

class ExpositionItemViewController: UIViewController {
    var expositionItem: [ExpositionItem]
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init?(coder: NSCoder, expositionItem: ExpositionItem) {
        self.expositionItem = [expositionItem]
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.expositionItem = []
        super.init(coder: coder)
    }
}
