//
//  DetailViewController.swift
//  Expo1900
//
//  Created by Wonbi on 2022/10/20.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        title = entry?.name
        
        setupDetailView()
    }
    
    func setupDetailView() {
        guard let entry = entry else { return }

        detailImage.image = UIImage(named: entry.imageName)
        descriptionTextView.text = entry.description
    }
}
