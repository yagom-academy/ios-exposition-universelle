//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    
    lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView(frame: .zero)
        scrollview.frame = self.view.bounds
        scrollview.contentSize = contentViewSize
        scrollview.autoresizingMask = .flexibleHeight
        scrollview.bounces = true
        return scrollview
    }()
    
    lazy var contentView: UIScrollView = {
        let contentview = UIScrollView(frame: .zero)
        contentview.frame.size = contentViewSize
        return contentview
    }()
    
    lazy var titleLabel = ExpositionLabel(text: "Title", textStyle: .largeTitle)
    
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "poster"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var visitorsLabel = ExpositionLabel(text: "visitors", textStyle: .largeTitle)
    
    lazy var locationLabel = ExpositionLabel(text: "Location", textStyle: .subheadline)
    
    lazy var durationLabel = ExpositionLabel(text: "duration", textStyle: .subheadline)
    
    lazy var descriptionLabel = ExpositionLabel(text: "description", textStyle: .body)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        let contents = [titleLabel, posterImageView, visitorsLabel, locationLabel, durationLabel, descriptionLabel]
        
        contents.forEach({
            contentView.addSubview($0)
            $0.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        })
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        
        visitorsLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 10).isActive = true
        
        locationLabel.topAnchor.constraint(equalTo: visitorsLabel.bottomAnchor, constant: 10).isActive = true
        
        durationLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 10).isActive = true
        
    }
}
