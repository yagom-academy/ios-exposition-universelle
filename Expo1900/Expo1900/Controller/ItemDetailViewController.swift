//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/22.
//

import UIKit

final class ItemDetailViewController: UIViewController {
    
    @IBOutlet weak private var expoDescriptionLabel: UILabel!
    @IBOutlet weak private var expoImageView: UIImageView!
    
    private var expoItemName: String?
    private var expoItemImage: String?
    private var expoItemDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        title = expoItemName
        expoDescriptionLabel.text = expoItemDescription
        expoDescriptionLabel.numberOfLines = 0
        if let expoItemImage = expoItemImage {
            expoImageView.image = UIImage(named: expoItemImage)
        }
    }
    
    func receiveData(from cell: ListTableViewCell) {
        expoItemName = cell.expoTitleLabel.text
        expoItemDescription = cell.expoDescription
        expoItemImage = cell.expoImageName
    }
}
