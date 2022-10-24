//
//  DetailViewController.swift
//  Created by sunnyCookie, Wonbi
// 

import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    private let entry: Entry
    
    init?(entry: Entry, coder: NSCoder) {
        self.entry = entry
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildNavigationBar()
        buildDetailView()
    }

    private func buildNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        title = entry.name
    }
    
    private func buildDetailView() {
        detailImage.image = UIImage(named: entry.imageName)
        descriptionTextView.text = entry.description
    }
}
