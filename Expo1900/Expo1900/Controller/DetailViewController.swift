//
//  DetailViewController.swift
//  Expo1900
//
//  Created by Hisop on 2023/11/02.
//

import UIKit

final class DetailViewController: UIViewController {
    private let name: String
    private let imageName: String
    private let detailDescription: String
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var explanation: UILabel!
    
    init?(coder: NSCoder, culturalAsset: CulturalAsset) {
        name = culturalAsset.name
        imageName = culturalAsset.imageName
        detailDescription = culturalAsset.detailDescription
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.title = "한국의 출품작"
        configureUI()
    }

    private func configureUI() {
        navigationItem.title = name
        imageView.image = UIImage(named: imageName)
        
        explanation.text = detailDescription
    }
}
