//
//  Expo1900 - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ExpositionPostViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "poster")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let visitorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let View = UITextView()
        View.textAlignment = .center
        View.translatesAutoresizingMaskIntoConstraints = false
        
        return View
    }()
    
    let flagImageView: UIImageView = {
        let flagimageView = UIImageView()
        flagimageView.backgroundColor = .red
        flagimageView.image = UIImage(named: "flag")
        flagimageView.contentMode = .scaleAspectFill
        flagimageView.translatesAutoresizingMaskIntoConstraints = false
        
        return flagimageView
    }()
    
    let expositionEnterButton: UIButton = {
        let expositionEnterButton = UIButton()
        expositionEnterButton.setTitle("한국의 출품작 보러가기", for: .normal)
        
        return expositionEnterButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
