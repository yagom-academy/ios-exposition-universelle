//  ExhibitDetailViewController.swift
//  Expo1900
//  Created by inho, LJ  on 2022/10/21.

import UIKit

final class ExhibitDetailViewController: UIViewController {
    @IBOutlet private weak var exhibitImageView: UIImageView!
    @IBOutlet private weak var exhibitDescriptionTextView: UITextView!
    private let exhibitData: ExhibitData
    
    required init?(exhibitData: ExhibitData, coder: NSCoder) {
        self.exhibitData = exhibitData
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }

    func configureView() {
        navigationItem.title = exhibitData.name
        exhibitImageView.image = exhibitData.image
        exhibitDescriptionTextView.text = exhibitData.description
    }
}
