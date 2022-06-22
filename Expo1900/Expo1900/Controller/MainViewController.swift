//
//  Expo1900 - ViewController.swift
//  Created by Kiwi, Finnn. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    
    private let mainScrollView = MainUIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        mainScrollView.addTargetKoreanEntryButton(target: self, action: #selector(didkoreanEntryButtonTapped), for: .touchUpInside)
    }
    
    override func loadView() {
        view = mainScrollView
    }
    
    @objc private func didkoreanEntryButtonTapped() {
        navigationController?.pushViewController(ItemTableViewController(), animated: true)
    }
}
