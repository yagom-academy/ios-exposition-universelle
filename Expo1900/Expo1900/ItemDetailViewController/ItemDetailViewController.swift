//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by Wonhee on 2020/12/22.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    var itemData: KoreaItem? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try setUpNavigationBar()
            try setUpUI()
        } catch {
            let alertController = self.errorAlert(error: error) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            self.showErrorAlert(alertController)
        }
    }
    private func setUpNavigationBar() throws {
        guard let item = itemData else {
            throw ExpositionError.getDetailItemData
        }
        self.navigationItem.title = item.name
    }
    private func setUpUI() throws {
        guard let item = itemData else {
            throw ExpositionError.getDetailItemData
        }
        itemImageView.image = UIImage(named: item.imageName)
        itemDescriptionLabel.text = item.description
    }
}

// MARK: - extension
extension ItemDetailViewController {
    func showErrorAlert(_ alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
}
