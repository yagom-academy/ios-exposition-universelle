//
//  ExpositionPosterScrollView.swift
//  Expo1900
//
//  Created by 김호준 on 2020/12/22.
//

import UIKit

protocol ExpositionPosterScrollViewDelegate: AnyObject {
    func didTapShowKoreanExhibitButton(_ scrollView: UIScrollView)
}

class ExpositionPosterScrollView: UIScrollView {
    var expositionPosterScrollViewDelegate: ExpositionPosterScrollViewDelegate?
    
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
    
    private let expositionTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let expositionInformationsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .italicSystemFont(ofSize: 20)
        label.textColor = .label
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .label
        label.font = .monospacedDigitSystemFont(ofSize: 15, weight: .regular)
        return label
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
        configureStackView()
        self.addSubview(expositionPosterStackView)
        setUpConstraints()
        showKoreaExhibitButton.addTarget(self, action: #selector(didTapShowKoreaExhibitButton), for: .touchUpInside)
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
        expositionTitleLabel.text = title[0] + "\n" + "(" + title[1]
        posterImageView.image = expositionModel.posterImage
        expositionInformationsLabel.text = "방문객 : \(String(expositionModel.visitors))명\n"
                                            + "개최지 : \(expositionModel.location)\n"
                                            + "개최 기간 : \(expositionModel.duration)"
        descriptionLabel.text = expositionModel.description
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
    
    private func configureStackView() {
        showKoreaExhibitStackView.addArrangedSubview(leftFlagImage)
        showKoreaExhibitStackView.addArrangedSubview(showKoreaExhibitButton)
        showKoreaExhibitStackView.addArrangedSubview(rightFlagImage)
        expositionPosterStackView.addArrangedSubview(expositionTitleLabel)
        expositionPosterStackView.addArrangedSubview(posterImageView)
        expositionPosterStackView.addArrangedSubview(expositionInformationsLabel)
        expositionPosterStackView.addArrangedSubview(descriptionLabel)
        expositionPosterStackView.addArrangedSubview(showKoreaExhibitStackView)
    }
    
    //MARK: - Actions
    @objc private func didTapShowKoreaExhibitButton() {
        expositionPosterScrollViewDelegate?.didTapShowKoreanExhibitButton(self)
    }
}
