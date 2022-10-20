//
//  ViewController.swift
//  ViewController
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import UIKit

class ViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let posterImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "poster"))
        return image
    }()
    
    let visitorsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var entryStackView: UIStackView = {
        let stackView = UIStackView()
        let flag = UIImageView(image: UIImage(named: "flag"))
        stackView.axis = .horizontal
        
        stackView.addArrangedSubview(flag)
        stackView.addArrangedSubview(entrybutton)
        stackView.addArrangedSubview(flag)
        return stackView
    }()
    
    let entrybutton: UIButton = {
        let button = UIButton()
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setLayout()
    }
    
    private func setLayout() {
        let layoutList: [UIView] = [
            titleLabel,
            posterImageView,
            visitorsLabel,
            locationLabel,
            durationLabel,
            descriptionLabel,
        ]
        
        layoutList.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

