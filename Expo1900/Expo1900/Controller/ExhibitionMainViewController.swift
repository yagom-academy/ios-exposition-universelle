//
//  Expo1900 - ExhibitionMainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExhibitionMainViewController: UIViewController {
    lazy var scrollView = UIScrollView()
    lazy var contentView = UIView()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        
        return stackView
    }()
    
    lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        
        buttonStackView.spacing = 10
        buttonStackView.axis = .horizontal
        
        return buttonStackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    lazy var visitorLabel = UILabel()
    lazy var locationLabel = UILabel()
    lazy var termLabel = UILabel()
    
    lazy var imageView: UIImageView = {
        let posterImage = UIImageView()
        
        posterImage.image = UIImage(named: NameSpace.poster)
        posterImage.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
        return posterImage
    }()
    
    lazy var descTextView: UITextView = {
        let textView = UITextView()

        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .left
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.adjustsFontForContentSizeCategory = true
        
        return textView
    }()
    
    lazy var leftFlagImageView: UIImageView = {
        let leftImage = UIImageView()
        
        leftImage.image = UIImage(named: NameSpace.flag)
        
        return leftImage
    }()
    
    lazy var rightFlagImageView: UIImageView = {
        let rightImage = UIImageView()
        
        rightImage.image = UIImage(named: NameSpace.flag)
        
        return rightImage
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        
        button.setTitle(NameSpace.showingKoreanWorks, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        
        return button
    }()
    
    var expositionPoster: ExpositionPoster?
    private let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpJSONMainData()
        self.setUI()
    }
    
    func setUpJSONMainData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: NameSpace.expoUniverselleKeys) else {
            return
        }
        
        do {
            expositionPoster = try jsonDecoder.decode(ExpositionPoster.self, from: dataAsset.data)
        } catch {
            print(NameSpace.errorState + error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        delegate.changeOrientation = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.isNavigationBarHidden = false
        delegate.changeOrientation = true
    }
    
    @objc func tappedButton(_ sender: UIButton) {
        let exhibitionWorkListVC = ExhibitionWorkListViewController()
        
        self.navigationController?.pushViewController(exhibitionWorkListVC, animated: true)
    }
}
