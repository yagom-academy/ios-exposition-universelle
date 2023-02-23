//
//  ItemDescriptionViewController.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/23.
//

import UIKit

class ItemDescriptionViewController: UIViewController {
    
    private let indexPath: IndexPath
    
    init(_ indexPath: IndexPath) {
        self.indexPath = indexPath
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
    }
    
    private func initializeView() {
        view.backgroundColor = .white
        self.title = ExhibitItem.items?[indexPath.row].name
    }
    
    private func setImageView() {
        
    }
    
    private func setDescriptionLabel() {
        
    }
}
