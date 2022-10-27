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
        configureAttribute()
        configureImageViewConstraints()
    }
}

private extension DetailViewController {
    func buildNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        title = entry.name
        navigationController?.navigationBar.topItem?.backButtonTitle = "출품작"
    }
    
    func buildDetailView() {
        detailImage.image = UIImage(named: entry.imageName)
        descriptionTextView.attributedText = entry.description.applyHangulAttribute()
    }
    
    func configureAttribute() {
        descriptionTextView.font = .preferredFont(forTextStyle: .body)
        descriptionTextView.adjustsFontForContentSizeCategory = true
    }
    
    func configureImageViewConstraints() {
        guard let image = detailImage.image else { return }
        
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        detailImage.widthAnchor.constraint(
            equalTo: view.widthAnchor,
            multiplier: 0.6
        ).isActive = true
        detailImage.heightAnchor.constraint(
            equalTo: detailImage.widthAnchor,
            multiplier: image.size.height / image.size.width
        ).isActive = true
    }
}
