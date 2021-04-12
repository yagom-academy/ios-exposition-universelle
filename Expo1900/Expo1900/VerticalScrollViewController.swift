//
//  VerticalScrollViewController.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/09.
//

import UIKit

class VerticalScrollViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.bounces = true
        return scrollview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        setUpScrollView()
    }
    
    private func setUpScrollView() {
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
}
