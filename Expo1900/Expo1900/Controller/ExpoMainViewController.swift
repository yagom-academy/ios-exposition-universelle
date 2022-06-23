//
//  KoreaItems.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/16.
//

import UIKit

final class ExpoMainViewController: UIViewController {
    //MARK: - Expo Main Property
    
    private var expoData: ExpoData?
    
    //MARK: - Expo Main View
    
    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = DetailSetUp.stackViewSpacing
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = DetailSetUp.labelNumberOfLines
        label.lineBreakStrategy = .hangulWordPriority
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = DetailSetUp.labelNumberOfLines
        label.lineBreakStrategy = .hangulWordPriority
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private let nextViewButton: UIButton = {
        let button = UIButton()
        button.setTitle(DetailSetUp.buttonTitle, for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.numberOfLines = DetailSetUp.labelNumberOfLines
        button.setContentCompressionResistancePriority(DetailSetUp.buttonCompressionResistancePriority, for: .horizontal)
        button.addTarget(nil, action: #selector(tappedNextViewButtonEvent), for: .touchUpInside)
        return button
    }()
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = DetailSetUp.title
        
        setMainView()
        setLabelText()
        addItemStackView()
        setViewConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Setting View Methods
    
    private func setMainView() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(mainScrollView)
        self.mainScrollView.addSubview(mainStackView)
    }
    
    private func setLabelText() {
        guard let expoInformation = fetchExpoInformation(from: Asset.expoInformation) else { return }
        expoData = expoInformation.toDomain()
        titleLabel.text = expoData?.title.replacingOccurrences(of: "(", with: "\n(")
        descriptionLabel.text = expoData?.description
    }
    
    private func addItemStackView() {
        let mainStackViewItemsArray = [
            titleLabel,
            createImageView(imageName: Asset.posterImage),
            createLabel(expoData?.visitors),
            createLabel(expoData?.location),
            createLabel(expoData?.duration),
            descriptionLabel,
            subStackView]
        mainStackViewItemsArray.forEach {self.mainStackView.addArrangedSubview($0)}
        
        let subStackViewItemsArray = [
            createImageView(imageName: Asset.flag),
            nextViewButton,
            createImageView(imageName: Asset.flag)]
        subStackViewItemsArray.forEach {self.subStackView.addArrangedSubview($0)}
    }
    
    private func setViewConstraints() {
        setScrollViewConstraints()
        setStackViewConstraints()
        setSubStackViewConstraints()
    }
    
    private func setScrollViewConstraints() {
        mainScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setStackViewConstraints() {
        mainStackView.topAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.bottomAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: mainScrollView.frameLayoutGuide.leadingAnchor, constant: DetailSetUp.mainStackViewLeadingWithFrameLayoutGuide).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: mainScrollView.frameLayoutGuide.trailingAnchor, constant: DetailSetUp.mainStackViewTrailingWithFrameLayoutGuide).isActive = true
    }
    
    private func setSubStackViewConstraints() {
        subStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: DetailSetUp.subStackViewTopWithDescriptionLabelBottom).isActive = true
        subStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor).isActive = true
        subStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor).isActive = true
        subStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor).isActive = true
        subStackView.heightAnchor.constraint(lessThanOrEqualToConstant: DetailSetUp.subStackViewMaxHeight).isActive = true
    }
    
    @objc private func tappedNextViewButtonEvent() {
        let koreaItemsTableViewController = KoreaItemTableViewController()
        self.navigationController?.pushViewController(koreaItemsTableViewController, animated: true)
    }
    
    private func createImageView(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    private func createLabel(_ text: String?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = DetailSetUp.labelNumberOfLines
        label.lineBreakMode = .byWordWrapping
        return label
    }
    
    //MARK: - Setting Data Method
    
    private func fetchExpoInformation(from assetName: String) -> ExpoInformation? {
        guard let expoInformationAsset = NSDataAsset(name: assetName),
              let expoInformation = try? JSONDecoder().decode(ExpoInformation.self, from: expoInformationAsset.data) else {
            return nil
        }
        return expoInformation
    }
}

//MARK: - NameSpace for Setting View Detail Option

extension ExpoMainViewController {
    private enum DetailSetUp {
        static let stackViewSpacing: CGFloat = 10
        static let labelNumberOfLines = 0
        static let buttonTitle = "한국의 출품작 보러가기"
        static let buttonCompressionResistancePriority = UILayoutPriority(751)
        static let title = "메인"
        static let mainStackViewLeadingWithFrameLayoutGuide: CGFloat = 10
        static let mainStackViewTrailingWithFrameLayoutGuide: CGFloat = -10
        static let subStackViewTopWithDescriptionLabelBottom: CGFloat = 10
        static let subStackViewMaxHeight: CGFloat = 50
    }
}
