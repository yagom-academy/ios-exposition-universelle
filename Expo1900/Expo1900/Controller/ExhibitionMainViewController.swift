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
        
        posterImage.image = UIImage(named: NameSpace.poster)
        
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
        
        leftImage.image = UIImage(named: NameSpace.flag)
        
        return leftImage
    }()
    
    let rightFlagImageView: UIImageView = {
        let rightImage = UIImageView()
        
        rightImage.image = UIImage(named: NameSpace.flag)
        
        return rightImage
    }()
    
    let button: UIButton = {
        let button = UIButton()
        
        button.setTitle(NameSpace.showingKoreanWorks, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
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
