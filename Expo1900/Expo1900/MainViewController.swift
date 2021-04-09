//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: VerticalScrollViewController {
    var titleLabel = ExpositionLabel(text: "Title", textStyle: .largeTitle)
    var posterImageView: UIImageView = {
        var posterImage = UIImage(named: "poster")
        if posterImage == nil {
            posterImage = UIImage(systemName: "zzz")
        }
        let imageView = UIImageView(image: posterImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    var visitorsLabel = ExpositionLabel(text: "visitors", textStyle: .subheadline)
    var locationLabel = ExpositionLabel(text: "Location", textStyle: .subheadline)
    var durationLabel = ExpositionLabel(text: "duration", textStyle: .subheadline)
    var descriptionLabel = ExpositionLabel(text: "description", textStyle: .body)
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
