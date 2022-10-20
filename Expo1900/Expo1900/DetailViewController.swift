//
//  DetailViewController.swift
//  Created by sunnyCookie, Wonbi
// 

import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildNavigationBar()
        buildDetailView()
    }
    
    private func buildNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        title = entry?.name
    }
    
    private func buildDetailView() {
        guard let entry = entry else { return }

        detailImage.image = UIImage(named: entry.imageName)
        descriptionTextView.text = entry.description
    }
}
