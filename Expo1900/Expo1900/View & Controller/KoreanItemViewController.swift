//
//  KoreanItemViewController.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/12.
//

import UIKit

class KoreanItemViewController: UIViewController {
    let koreanItemData: KoreanItem
    let scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.backgroundColor = .white
        scrollview.bounces = true
        return scrollview
    }()
    lazy var itemImageView = ExpositionImageView(imageName: koreanItemData.imageName)
    lazy var itemDescriptionLabel = ExpositionLabel(text: koreanItemData.description, textStyle: .body)
    lazy var contents = [itemImageView, itemDescriptionLabel]
    
    init(data: KoreanItem) {
        koreanItemData = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView()
        setContents()
    }
    
    private func setUpScrollView() {
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    private func setContents() {
        setConstraint(intervalOf: 10)
        contents.forEach({ scrollView.addSubview($0) })
    }
    private func setConstraint(intervalOf interval: CGFloat) {
        contents.enumerated().forEach({ (index, item) in
            scrollView.addSubview(item)
            item.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            item.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20).isActive = true
            
            if index == 0 {
                item.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            } else {
                item.topAnchor.constraint(equalTo: contents[index-1].bottomAnchor, constant: interval).isActive = true
            }
            
            if index == contents.count - 1 {
                item.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            }
        })
    }
}
