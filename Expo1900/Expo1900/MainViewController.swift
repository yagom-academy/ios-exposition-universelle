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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
}
