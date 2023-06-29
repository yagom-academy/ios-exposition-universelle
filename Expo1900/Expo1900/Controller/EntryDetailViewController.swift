//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/06/29.
//

import UIKit

class EntryDetailViewController: UIViewController {
    @IBOutlet weak var entryImage: UIImageView!
    @IBOutlet weak var entryDescription: UILabel!
    var data: Entry?
    
    init?(coder: NSCoder, data: Entry?) {
        self.data = data
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertData()
    }
    
    func insertData() {
        navigationItem.title = data?.name
        self.entryDescription.text = data?.description
        self.entryImage.image = entryImage.insertImage(name: data?.imageName)
    }
}
