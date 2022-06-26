//
//  DescriptionViewController.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/17.
//

import UIKit

class DescriptionViewController: UIViewController {
    var entryList: EntryList?
    let scrollView = UIScrollView()
    let contentsView = UIView()
    let imageView = UIImageView()
    let descriptionLabel = UILabel()
    let stackView = UIStackView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setConstraints()
        setUI()
        self.imageView.image = UIImage(named: entryList?.imageName ?? ExpoNameSpace.empty.name)
        self.title = entryList?.name
        self.descriptionLabel.text = entryList?.description
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(entryList: EntryList) {
        super.init(nibName: nil, bundle: nil)
        self.entryList = entryList
        self.viewDidLoad()
    }
}
