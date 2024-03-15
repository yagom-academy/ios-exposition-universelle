//
//  ViewController.swift
//  Expo1900
//
//  Created by Danny, Gray on 3/13/24.
//

import UIKit

class ViewController: UIViewController {
 
    var expositionIntroduction: ExpositionIntroduction!
    
    private var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    private var posterImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var visitorLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private var locationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var durationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let expositionIntroductionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    private let koreanFlagImageViewFirst: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flag")
        return imageView
    }()
    
    private let koreanFlagImageViewSecond: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flag")
        return imageView
    }()
    
    private let koreanHeritageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("한국 출품작 보러가기", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            self.expositionIntroduction = try jsonDecoder.decode(ExpositionIntroduction.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let visitorString: String = numberFormatter.string(for: expositionIntroduction.visitors) else {
            return
        }

        mainTitleLabel.text = String(expositionIntroduction.title.prefix(13))
        subTitleLabel.text = String(expositionIntroduction.title.suffix(28))
        posterImageView.image = UIImage(named: "poster.png")
        visitorLabel.attributedText = textAttributedToString(text: "방문객 : \(visitorString) 명", length: 3)
        locationLabel.attributedText = textAttributedToString(text: "개최지 : \(expositionIntroduction.location)", length: 3)
        durationLabel.attributedText = textAttributedToString(text: "개최 기간 : \(expositionIntroduction.duration)", length: 6)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = expositionIntroduction.description
        koreanHeritageButton.addTarget(self, action: #selector(openKoreanHeritageViewController), for: .touchUpInside)
        
        addSubview()

    }
    
    func textAttributedToString(text: String, length: Int) -> NSAttributedString {
        let textAttributes:[NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 20)]
        let textAttributedToString = NSMutableAttributedString(string: text)
        textAttributedToString.addAttributes(textAttributes, range: NSRange(location: 0, length: length))
        return textAttributedToString
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func openKoreanHeritageViewController() {
        let secondViewController = SecondViewController()
        let backBarButtonItem = UIBarButtonItem(title: "메인", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        secondViewController.title = "한국의 출품작"
        
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func addSubview() {
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(contentView)
        contentView.addSubview(expositionIntroductionStackView)
        expositionIntroductionStackView.addArrangedSubview(mainTitleLabel)
        expositionIntroductionStackView.addArrangedSubview(subTitleLabel)
        expositionIntroductionStackView.addArrangedSubview(posterImageView)
        expositionIntroductionStackView.addArrangedSubview(visitorLabel)
        expositionIntroductionStackView.addArrangedSubview(locationLabel)
        expositionIntroductionStackView.addArrangedSubview(durationLabel)
        expositionIntroductionStackView.addArrangedSubview(descriptionLabel)
        expositionIntroductionStackView.addArrangedSubview(buttonStackView)
        buttonStackView.addArrangedSubview(koreanFlagImageViewFirst)
        buttonStackView.addArrangedSubview(koreanHeritageButton)
        buttonStackView.addArrangedSubview(koreanFlagImageViewSecond)
        
        setUpUIConstraints()
    }
    
    private func setUpUIConstraints() {
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: contentScrollView.widthAnchor),
            
            expositionIntroductionStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            expositionIntroductionStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            expositionIntroductionStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            expositionIntroductionStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            
            koreanFlagImageViewFirst.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor, multiplier: 0.2),
            koreanFlagImageViewSecond.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor, multiplier: 0.2)
        ])
        
    }
    
}
