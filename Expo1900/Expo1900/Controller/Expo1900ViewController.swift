//
//  KoreaItems.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/16.
//

import UIKit

class Expo1900ViewController: UIViewController {
    let expo1900ScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(expo1900ScrollView)
        setScrollViewConstraints()
    }

    private func setScrollViewConstraints() {
        expo1900ScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        expo1900ScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        expo1900ScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        expo1900ScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }

}


