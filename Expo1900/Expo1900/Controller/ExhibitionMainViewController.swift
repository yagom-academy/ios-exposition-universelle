//
//  Expo1900 - ExhibitionMainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExhibitionMainViewController: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        
        return stackView
    }()
    
    let buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        
        buttonStackView.spacing = 10
        buttonStackView.axis = .horizontal
        
        return buttonStackView
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        
        title.numberOfLines = 0
        title.textAlignment = .center
        
        return title
    }()
    
    let visitorLabel = UILabel()
    let locationLabel = UILabel()
    let termLabel = UILabel()
    
    let imageView: UIImageView = {
        let posterImage = UIImageView()
        
        posterImage.image = UIImage(named: "poster")
        
        return posterImage
    }()
    
    let descTextView: UITextView = {
        let textView = UITextView()

        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .left
        textView.font = .systemFont(ofSize: 18)
        
        return textView
    }()
    
    let leftFlagImageView: UIImageView = {
        let leftImage = UIImageView()
        
        leftImage.image = UIImage(named: "flag")
        
        return leftImage
    }()
    
    let rightFlagImageView: UIImageView = {
        let rightImage = UIImageView()
        
        rightImage.image = UIImage(named: "flag")
        
        return rightImage
    }()
    
    let button: UIButton = {
        let button = UIButton()
        
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    var expositionPoster: ExpositionPoster?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpJSONMainData()
        self.setUI()
    }
    
    func setUpJSONMainData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            expositionPoster = try jsonDecoder.decode(ExpositionPoster.self, from: dataAsset.data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    @objc func tappedButton(_ sender: UIButton) {
        let exhibitionWorkListViewController = ExhibitionWorkListViewController()
        self.present(exhibitionWorkListViewController, animated: true, completion: nil)
    }
}

