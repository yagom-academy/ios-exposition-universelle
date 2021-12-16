//
//  ExpoItemDetailViewController.swift
//  Expo1900
//
//  Created by Aladdin on 2021/12/13.
//

import UIKit

final class ExpoItemDetailViewController: UIViewController {
    
    @IBOutlet weak var itemDetailImageView: UIImageView!
    @IBOutlet weak var itemDetailExplanationTextView: UITextView!
    
    var expoItem: ExpoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDetailView()
    }
    
    private func setUpDetailView() {
        guard let expoItem = expoItem else {
            return
        }
        navigationItem.title = expoItem.name
        itemDetailImageView.image = UIImage(named: expoItem.imageName)
        itemDetailExplanationTextView.text = expoItem.explanation
    }
}
