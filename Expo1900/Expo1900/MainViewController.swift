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
        
        lineUpContentsAtInterval(of: 10)
    }
    
    private func lineUpContentsAtInterval(of interval: CGFloat) {
        let contents = [titleLabel, posterImageView, visitorsLabel, locationLabel, durationLabel, descriptionLabel]
        
        contents.enumerated().forEach({ (index, item) in
            contentView.addSubview(item)
            item.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            item.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
            if index == 0 {
                item.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            } else {
                item.topAnchor.constraint(equalTo: contents[index-1].bottomAnchor, constant: interval).isActive = true
            }
        })
    }
}
