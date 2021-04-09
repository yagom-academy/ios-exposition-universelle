//
//  KoreaDetailEntryViewController.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/07.
//

import UIKit

final class KoreaDetailEntryViewController: UIViewController {
    @IBOutlet private weak var detailImage: UIImageView!
    @IBOutlet private weak var descriptionLable: UILabel!
    
    private var detailEntry: StateEntry

    override func viewDidLoad() {
        do {
            try setDetailEntry()
        } catch {
            alterError(error)
        }
    }
    
    init(_ EntryValue: StateEntry) {
        detailEntry = EntryValue
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Init Setting

    private func setDetailEntry() throws {
        detailImage.image = UIImage(named: detailEntry.imageName)
        descriptionLable.text = detailEntry.description
        self.navigationItem.title = detailEntry.name
        
        descriptionLable.lineBreakStrategy = .hangulWordPriority
        descriptionLable.textAlignment = .justified
        descriptionLable.numberOfLines = 0
    }
}
