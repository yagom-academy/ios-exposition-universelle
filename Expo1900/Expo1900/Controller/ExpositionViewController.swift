//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    // MARK: - Properties
    private var exposition: Exposition?
    private let jsonParser = JSONParser<Exposition>()
    
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var visitorsTitleLabel: UILabel?
    @IBOutlet private weak var visitorsLabel: UILabel?
    @IBOutlet private weak var locationTitleLabel: UILabel?
    @IBOutlet private weak var locationLabel: UILabel?
    @IBOutlet private weak var durationTitleLabel: UILabel?
    @IBOutlet private weak var durationLabel: UILabel?
    @IBOutlet private weak var descriptionLabel: UILabel?
    
    @IBOutlet private weak var visitorsStackView: UIStackView?
    @IBOutlet private weak var locationStackView: UIStackView?
    @IBOutlet private weak var durationStackView: UIStackView?
    
    @IBOutlet private weak var expositionItemTableButton: UIButton?
    
    @IBOutlet private weak var posterImage: UIImageView?
    @IBOutlet private var flagImages: [UIImageView]?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayoutByDynamicType()
        fetchData()
        setupUI()
        updateUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(setLayoutByDynamicType), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    @objc private func setLayoutByDynamicType() {
        let stackViews = [visitorsStackView, locationStackView, durationStackView]
        
        if traitCollection.preferredContentSizeCategory.isAccessibilityCategory {
            stackViews.forEach {
                $0?.axis = .vertical
            }
        } else {
            stackViews.forEach {
                $0?.axis = .horizontal
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // MARK: - Methods
    private func fetchData() {
        do {
            exposition = try jsonParser.decode(fileName: AssetFileName.exposition)
        } catch {
            print(error)
        }
    }
    
    private func setupUI() {
        titleLabel?.setDynamicType(textStyle: .title2)
        titleLabel?.numberOfLines = 0
        
        [visitorsTitleLabel, durationTitleLabel, locationTitleLabel].forEach { label in
            label?.setDynamicType(textStyle: .headline)
        }
        
        [visitorsLabel, durationLabel, locationLabel].forEach { label in
            label?.setDynamicType(textStyle: .subheadline)
            label?.numberOfLines = 0
        }
        
        descriptionLabel?.setDynamicType(textStyle: .body)
        descriptionLabel?.numberOfLines = 0
        
        if #available(iOS 14.0, *) {
            descriptionLabel?.lineBreakStrategy = .hangulWordPriority
        } else {
            descriptionLabel?.lineBreakMode = .byWordWrapping
        }
        
        expositionItemTableButton?.applyAccessibilityWithText(textStyle: .body)
        
        flagImages?.forEach {
            $0.contentMode = .scaleAspectFit
        }
    }
    
    private func updateUI() {
        self.title = "메인"
        
        guard let exposition = exposition else {
            return
        }
        
        titleLabel?.text = exposition.titleWithLineBreak
        visitorsLabel?.text = ": \(exposition.visitors.formattedString) 명"
        locationLabel?.text = ": \(exposition.location)"
        durationLabel?.text = ": \(exposition.duration)"
        descriptionLabel?.text = exposition.description
        
        posterImage?.image = UIImage(named: AssetFileName.poster)
        flagImages?.forEach { $0.image = UIImage(named: AssetFileName.flag) }
    }
}

// MARK: - IBAction
extension ExpositionViewController {
    @IBAction private func touchUpExpositionItemTableButton(_ sender: UIButton) {
        let expositionItemTableViewController = ViewControllerFactory.createViewController(of: .expositionItemTable)
        
        self.navigationController?.pushViewController(expositionItemTableViewController, animated: true)
    }
}

