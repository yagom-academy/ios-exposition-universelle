//
//  ExpositionPosterScrollView.swift
//  Expo1900
//
//  Created by 김호준 on 2020/12/22.
//

import UIKit

class ExpositionPosterScrollView: UIScrollView {
    //MARK: - Views
    private let expositionPosterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.distribution = .fill
        return stackView
    }()
    
    private let expositionTitleTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.textAlignment = .center
        textView.textColor = .label
        textView.font = .boldSystemFont(ofSize: 30)
        return textView
    }()
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let expositionInformationsTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.textAlignment = .center
        textView.textColor = .label
        return textView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .label
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.font = .boldSystemFont(ofSize: 20)
        return textView
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        expositionPosterStackView.addArrangedSubview(expositionTitleTextView)
        expositionPosterStackView.addArrangedSubview(posterImageView)
        expositionPosterStackView.addArrangedSubview(expositionInformationsTextView)
        expositionPosterStackView.addArrangedSubview(descriptionTextView)
        self.addSubview(expositionPosterStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
