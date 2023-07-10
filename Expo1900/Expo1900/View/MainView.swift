//
//  MainView.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/28.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func didTappedKoreaEntryButton()
}

final class MainView: UIView {
    weak var delegate: MainViewDelegate?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints  = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let contentStackView: UIStackView = {
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 8
        contentStackView.alignment = .center
        contentStackView.distribution = .equalSpacing
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        return contentStackView
    }()
    
    private let titleLabel: CommonLabel = {
        let titleLabel = CommonLabel()
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        return titleLabel
    }()
    
    private let visitorsLabel = CommonLabel()
    private let locationLabel = CommonLabel()
    private let durationLabel = CommonLabel()
    private let descriptionLabel = CommonLabel()
    private let infoImage: UIImageView = {
        let infoImage = UIImageView()
        infoImage.image = UIImage(named: "poster")
        return infoImage
    }()
    
    private let bottomStackView: UIStackView = {
        let bottomStackView = UIStackView()
        bottomStackView.axis = .horizontal
        bottomStackView.spacing = 10
        bottomStackView.distribution = .equalSpacing
        return bottomStackView
    }()
    
    private let leftImage: UIImageView = {
        let leftImage = UIImageView()
        leftImage.image = UIImage(named: "flag")
        return leftImage
    }()
    
    private let rightImage: UIImageView = {
        let rightImage = UIImageView()
        rightImage.image = UIImage(named: "flag")
        return rightImage
    }()
    
    private lazy var koreaExpositionButton: UIButton = {
        let koreaExpositionButton = UIButton()
        koreaExpositionButton.setTitle("한국 박람회 전시", for: .normal)
        koreaExpositionButton.setTitleColor(.systemBlue, for: .normal)
        koreaExpositionButton.addTarget(self, action: #selector(didTappedKoreaExhibitionButton), for: .touchUpInside)
        koreaExpositionButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        koreaExpositionButton.titleLabel?.adjustsFontForContentSizeCategory = true
        koreaExpositionButton.titleLabel?.adjustsFontSizeToFitWidth = true
        return koreaExpositionButton
    }()
    
    private let keywordFont = UIFont.preferredFont(forTextStyle: .title2)
    private let noneKeywordFont = UIFont.preferredFont(forTextStyle: .body)
    
    convenience init() {
        self.init(frame: CGRectZero)
        
        configureUI()
        setUpConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        [leftImage, koreaExpositionButton, rightImage].forEach {
            bottomStackView.addArrangedSubview($0)
        }

        [titleLabel, infoImage, visitorsLabel, locationLabel, durationLabel, descriptionLabel, bottomStackView].forEach {
            contentStackView.addArrangedSubview($0)
        }
        
        contentView.addSubview(contentStackView)
        scrollView.addSubview(contentView)
        addSubview(scrollView)
    }
    
    private func setUpConstraints() {
        setUpScrollViewConstraints()
        setUpContentViewConstraints()
        setUpContentStackViewConstraints()
        setUpImageViewConstraints()
    }
}

// MARK: - Delegate
extension MainView {
    @objc func didTappedKoreaExhibitionButton() {
        delegate?.didTappedKoreaEntryButton()
    }
}

// MARK: - Load Information
extension MainView {
    func load(information: ParisExpositionInformation) {
        titleLabel.text = information.title.replacingOccurrences(of: "(", with: "\n(")
        locationLabel.attributedText = "개최지 : \(information.location)".addAttributeFontForKeyword(keywordFont: keywordFont,
                                                                noneKeywordFont: noneKeywordFont,
                                                                keyword: "개최지")
        durationLabel.attributedText = "개최 기간 : \(information.duration)".addAttributeFontForKeyword(keywordFont: keywordFont,
                                                                noneKeywordFont: noneKeywordFont,
                                                                keyword: "개최 기간")
        descriptionLabel.text = information.description
        loadVisitorsInformation(information.visitors)
    }
    
    private func loadVisitorsInformation(_ visitors: UInt) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let visitorsAsNumber = numberFormatter.number(from: visitors.description) ?? 0
        guard let visitorsAsFormatterString = numberFormatter.string(from: visitorsAsNumber) else { return }
        
        visitorsLabel.attributedText = "방문객 : \(visitorsAsFormatterString) 명".addAttributeFontForKeyword(keywordFont: keywordFont, noneKeywordFont: noneKeywordFont, keyword: "방문객")
    }
}

// MARK: - Constraints
extension MainView {
    private func setUpScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: topAnchor),
            scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setUpContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, multiplier: 1)
        ])
        
        let contentViewHeightConstraints = contentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor, constant: 1)
        contentViewHeightConstraints.priority = .init(1)
        contentViewHeightConstraints.isActive = true
    }
    
    private func setUpContentStackViewConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setUpImageViewConstraints() {
        NSLayoutConstraint.activate([
            leftImage.heightAnchor.constraint(equalToConstant: 40),
            leftImage.widthAnchor.constraint(equalToConstant: 60),
            rightImage.heightAnchor.constraint(equalToConstant: 40),
            rightImage.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}
