//
//  ViewController.swift
//  Expo1900
//
//  Created by Danny on 3/13/24.
//

import UIKit

class ViewController: UIViewController {
 
    var expositionIntroduction: ExpositionIntroduction!
    
    private var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
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
        
        
        mainTitleLabel.text = String(expositionIntroduction.title.prefix(13))
        subTitleLabel.text = String(expositionIntroduction.title.suffix(28))
        
        addSubview()

    }
    
    func addSubview() {
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(contentView)
        contentView.addSubview(expositionIntroductionStackView)
        expositionIntroductionStackView.addArrangedSubview(mainTitleLabel)
        expositionIntroductionStackView.addArrangedSubview(subTitleLabel)
        
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
            expositionIntroductionStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            expositionIntroductionStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),

        ])
    }
    
}
