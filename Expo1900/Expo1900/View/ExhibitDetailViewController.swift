//  ExhibitDetailViewController.swift
//  Expo1900
//  Created by inho, LJ  on 2022/10/21.

import UIKit

class ExhibitDetailViewController: UIViewController {
    @IBOutlet private weak var exhibitImageView: UIImageView!
    @IBOutlet private weak var exhibitDescriptionTextView: UITextView!
    private var exhibitData: ExhibitData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func fetchExhibitData(_ data: ExhibitData?) {
        exhibitData = data
    }
    
    func configureView() {
        guard let exhibit = exhibitData else {
            return
        }

        navigationItem.title = exhibit.name
        exhibitImageView.image = exhibit.image
        exhibitDescriptionTextView.text = exhibit.description
    }
}
