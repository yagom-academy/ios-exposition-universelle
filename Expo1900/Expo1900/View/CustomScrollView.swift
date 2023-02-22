//
//  CustomScrollView.swift
//  Expo1900
//
//  Created by Harry, 레옹아범 on 2023/02/21.
//

import UIKit

class CustomScrollView: UIScrollView {

    private let stackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .equalSpacing
        
        return stack
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.showsVerticalScrollIndicator = false
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        self.addSubview(stackView)
        
        let scrollContentGuide = self.contentLayoutGuide
        let scrollFrameGuide = self.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
            
            self.stackView.widthAnchor.constraint(equalTo: scrollFrameGuide.widthAnchor)
        ])
        
        self.stackView.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
        self.stackView.isLayoutMarginsRelativeArrangement = true
    }
    
    func addArrangeSubView(view: UIView) {
        self.stackView.addArrangedSubview(view)
    }
    
}
