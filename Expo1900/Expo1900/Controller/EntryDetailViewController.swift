//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/02.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    private var expoEntry: ExpoEntry
    
    @IBOutlet private weak var entryImageView: UIImageView!
    @IBOutlet private weak var entryDescription: UILabel!
    
    init?(expoEntry: ExpoEntry, coder: NSCoder) {
        self.expoEntry = expoEntry
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
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
        navigationItem.title = expoEntry.name
    }
    
    private func updateEntryDetailView() {
        entryImageView.image = UIImage(named: expoEntry.imageName)
        entryDescription.text = expoEntry.entryDescription
    }
}
