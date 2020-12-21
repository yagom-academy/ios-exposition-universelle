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
        textView.isScrollEnabled = false
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
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        textView.font = .italicSystemFont(ofSize: 20)
        textView.textColor = .label
        return textView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .label
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.font = .monospacedDigitSystemFont(ofSize: 15, weight: .regular)
        return textView
    }()
    
    private let showKoreaExhibitStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let showKoreaExhibitButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return button
    }()
    
    private let leftFlagImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.image = UIImage(named: "flag")
        return imageView
    }()
    
    private let rightFlagImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.image = UIImage(named: "flag")
        return imageView
    }()
    
    
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        showKoreaExhibitStackView.addArrangedSubview(leftFlagImage)
        showKoreaExhibitStackView.addArrangedSubview(showKoreaExhibitButton)
        showKoreaExhibitStackView.addArrangedSubview(rightFlagImage)
        expositionPosterStackView.addArrangedSubview(expositionTitleTextView)
        expositionPosterStackView.addArrangedSubview(posterImageView)
        expositionPosterStackView.addArrangedSubview(expositionInformationsTextView)
        expositionPosterStackView.addArrangedSubview(descriptionTextView)
        expositionPosterStackView.addArrangedSubview(showKoreaExhibitStackView)
        self.addSubview(expositionPosterStackView)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public
    public func configurePoster(with exposition: Exposition?) {
        guard let expositionModel = exposition else {
            return
        }
        let title = expositionModel.title.components(separatedBy: "(")
        expositionTitleTextView.text = title[0] + "\n" + "(" + title[1]
        posterImageView.image = expositionModel.posterImage
        expositionInformationsTextView.text = "방문객 : \(String(expositionModel.visitors))명\n"
                                            + "개최지 : \(expositionModel.location)\n"
                                            + "개최 기간 : \(expositionModel.duration)"
        descriptionTextView.text = expositionModel.description
    }
    
    //MARK: - Private
    private func setUpConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(expositionPosterStackView.leadingAnchor.constraint(equalTo: self.contentLayoutGuide.leadingAnchor))
        constraints.append(expositionPosterStackView.trailingAnchor.constraint(equalTo: self.contentLayoutGuide.trailingAnchor))
        constraints.append(expositionPosterStackView.topAnchor.constraint(equalTo: self.contentLayoutGuide.topAnchor))
        constraints.append(expositionPosterStackView.bottomAnchor.constraint(equalTo: self.contentLayoutGuide.bottomAnchor))
        constraints.append(expositionPosterStackView.widthAnchor.constraint(equalTo: self.frameLayoutGuide.widthAnchor))
        NSLayoutConstraint.activate(constraints)
    }
}
