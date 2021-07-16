//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by Marco, Soll, Yescoach on 2021/07/13.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: @IBOutlets
    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: Properties
    private var entry: Entry?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        entryImageView.image = UIImage(named: entry?.imageName ?? "")
        descriptionLabel.text = entry?.description
        self.title = entry?.name
    }
    
    static func updateModel(by entry: Entry) -> EntryDetailViewController? {
        let vcInstance = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "EntryDetailViewController") as? EntryDetailViewController
        vcInstance?.entry = entry
        return vcInstance
    }
}
