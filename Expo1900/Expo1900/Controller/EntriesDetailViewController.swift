//  Expo1900 - EntriesDetailViewController.swift
//  Created by Mangdi, zhilly on 2022/10/20

import UIKit

final class EntriesDetailViewController: UIViewController {
    
    @IBOutlet private weak var entryImage: UIImageView!
    @IBOutlet private weak var entryDescription: UITextView!
    
    var koreanEntry: KoreanEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureEntryDetail()
    }
    
    private func configureEntryDetail() {
        self.title = koreanEntry?.name
        self.entryImage.image = UIImage(named: koreanEntry?.imageName ?? "")
        self.entryDescription.text = koreanEntry?.description
    }
}
