//
//  VerticalScrollViewController.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/09.
//

import UIKit

class VerticalScrollViewController: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
}
