//  Expo1900 - EntriesDetailViewController.swift
//  Created by Mangdi, zhilly on 2022/10/20

import UIKit

class EntriesDetailViewController: UIViewController {
    
    @IBOutlet weak var entryImage: UIImageView!
    @IBOutlet weak var entryDescription: UITextView!
    
    var koreanEntry: KoreanEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureEntryDetail()
    }
    
    func configureEntryDetail() {
        self.title = koreanEntry?.name
        self.entryImage.image = UIImage(named: koreanEntry?.imageName ?? "")
        self.entryDescription.text = koreanEntry?.description
    }
}
