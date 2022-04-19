//
//  itemDetailViewController.swift
//  Expo1900
//
//  Created by 사파리, 파프리 on 2022/04/15.
//

import UIKit

final class ItemDetailViewController: UIViewController {
    private let item: Heritage
    
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var ItemDescriptionLabel: UILabel!
    
    init?(item: Heritage, coder: NSCoder) {
        self.item = item
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.item = Heritage(title: "데이터 입력 실패", imageName: "swift", shortDescription: "데이터 입력 실패", description: "데이터 입력 실패")
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        title = item.title
        itemImageView.image = UIImage(named: item.imageName)
        ItemDescriptionLabel.text = item.description
    }
}
