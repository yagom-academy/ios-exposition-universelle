//
//  MainView.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/28.
//

import UIKit

class MainView: UIView {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "타이틀"
        return titleLabel
    }()
    

}
