//
//  KoreanItemViewController.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/12.
//

import UIKit

class KoreanItemViewController: VerticalScrollViewController {
    
    var koreanItemsData = KoreanItem()
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let itemDescriptionLabel = ExpositionLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setItemImageView() {
        let image = UIImage(named: koreanItemsData.imageName) ?? UIImage(systemName: "zzz")
        itemImageView.image = image
    }
    
    private func setConstraint(intervalOf interval: CGFloat) {
        let contents = [itemImageView, itemDescriptionLabel]
        
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
