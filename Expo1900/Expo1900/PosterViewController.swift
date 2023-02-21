//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class PosterViewController: UIViewController {

    private let exposition: Exposition? = {
        let decoder = Decoder()
        return decoder.decodeExposition()
    }()
    
    private var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        setStackView()
        setTitleLabel()
        setImageView()
    }
    
    func setStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
    }
    
    func setTitleLabel() {
        guard var title = exposition?.title else { return }

        if let index = title.range(of: "(")?.lowerBound {
            title.insert(contentsOf: "\n", at: index)
        }

        let titleLabel = UILabel()
        
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 26)
        
        stackView.addArrangedSubview(titleLabel)
        
    }
    
    func setImageView() {
        let imageView = UIImageView()
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "poster")
        imageView.image = image
        
        stackView.addArrangedSubview(imageView)
    }
    
}




// MARK: - Canvas
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = PosterViewController
    
    func makeUIViewController(context: Context) -> PosterViewController {
            return PosterViewController()
        }

    func updateUIViewController(_ uiViewController: PosterViewController, context: Context) {
    }
}
@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
