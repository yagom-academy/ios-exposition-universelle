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
        setTitleLabel()
        setImageView()
    }
    
    func setStackView() {
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
    }
    
    
    func setTitleLabel() {
        guard var title = exposition?.title else { return }

        if let index = title.range(of: "(")?.lowerBound {
            title.insert(contentsOf: "\n", at: index)
        }

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.numberOfLines = 0

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(titleLabel)

        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 26)
    }
    
    func setImageView() {

        // UIImageView 생성
        let imageView = UIImageView()
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        
        // Assets에서 이미지 불러오기
        let image = UIImage(named: "poster")
        
        // UIImageView에 이미지 설정하기
        imageView.image = image
        
 
        imageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(imageView)

        //imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        

    }
    
}




// MARK: Canvas
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
