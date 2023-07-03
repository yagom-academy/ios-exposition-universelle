//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/02.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    
    @IBOutlet private weak var entryImageView: UIImageView!
    @IBOutlet private weak var entryDescription: UILabel!

    var expoEntry: ExpoEntry?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateEntryDetailView()
    }
    
    func updateNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = expoEntry?.name
    }
    
    func updateEntryDetailView() {
        entryImageView.image = UIImage(named: expoEntry?.imageName ?? AssetsNameSpace.flagImage)
        entryDescription.text = expoEntry?.entryDescription
    }
}
