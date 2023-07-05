//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/02.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    var expoEntry: ExpoEntry?
    
    @IBOutlet private weak var entryImageView: UIImageView!
    @IBOutlet private weak var entryDescription: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateEntryDetailView()
    }
    
    private func updateNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = expoEntry?.name
    }
    
    private func updateEntryDetailView() {
        entryImageView.image = UIImage(named: expoEntry?.imageName ?? AssetsNameSpace.flagImage)
        entryDescription.text = expoEntry?.entryDescription
    }
}
