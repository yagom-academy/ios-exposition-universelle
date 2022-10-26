//
//  DetailWorkViewContorller.swift
//  Expo1900
//
//  Created by Som, Stone, Aaron on 2022/10/20.
//

import UIKit

class DetailWorkViewController: UIViewController {
    private lazy var imageView = UIImageView()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .left
        textView.font = .systemFont(ofSize: 18)
        
        return textView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
        
    lazy var scrollView = UIScrollView()
    
    let contentView = UIView()
    
    var exhibitionWork: ExhibitionWork?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDetailData()
        
        setScrollViewConstraints()
        setContentViewConstraints()
        
        setStackViewConstraints()
        setStackViewSubViews()
    }

    func setUpDetailData() {
        if let imageName = exhibitionWork?.imageName,
            let assetImage = UIImage(named: imageName) {
            imageView.image = assetImage
        } else {
            imageView.image = UIImage(systemName: "xmark.seal")
        }
        
        textView.text = exhibitionWork?.desc ?? "설명 없음"
        title = exhibitionWork?.name ?? "제목 없음"
    }

    private func setContentViewConstraints() {
        self.scrollView.addSubview(contentView)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)])
    }
    
    func setStackViewSubViews() {
        [imageView, textView].forEach { self.stackView.addArrangedSubview($0) }
    }
    
    private func setStackViewConstraints() {
        self.contentView.addSubview(stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
    
    private func setScrollViewConstraints() {
        self.view.addSubview(scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}
