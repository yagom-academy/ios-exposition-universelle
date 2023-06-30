//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/29.
//

import UIKit

final class DetailEntryViewController: UIViewController {
    @IBOutlet weak var entryImage: UIImageView!
    @IBOutlet weak var entryDescriptionLabel: UILabel!
    
    private var entryData: Entry
    
    init?(coder: NSCoder, data: Entry) {
        self.entryData = data
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertData()
    }
    
    private func insertData() {
        navigationItem.title = entryData.name
        self.entryDescriptionLabel.text = entryData.description
        self.entryImage.image = UIImage(named: entryData.imageName)
    }
}
