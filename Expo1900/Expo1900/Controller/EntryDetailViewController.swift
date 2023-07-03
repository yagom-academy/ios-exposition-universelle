//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/02.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var entryDescription: UILabel!

    var expoEntry: ExpoEntry?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = expoEntry?.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateEntryDetailView()
    }
    
    func updateEntryDetailView() {
        entryImageView.image = UIImage(named: expoEntry?.imageName ?? "flag")
        entryDescription.text = expoEntry?.entryDescription
    }
}
