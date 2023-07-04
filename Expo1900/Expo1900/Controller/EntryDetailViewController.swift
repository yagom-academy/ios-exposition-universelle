//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by MARY, KOBE on 2023/06/30.
//

import UIKit

final class EntryDetailViewController: UIViewController {
	@IBOutlet weak var koreaEntryImageView: UIImageView!
	@IBOutlet weak var entryDescLabel: UILabel!
    
    var koreanEntryImage: UIImage?
    var entryDescription: String?
    var entryTitle: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		guard let koreanEntryImage = koreanEntryImage,
              let entryDescription = entryDescription else {
            return
        }
		
		koreaEntryImageView.image = koreanEntryImage
		entryDescLabel.text = entryDescription
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
        
		guard let entryTitle = entryTitle else { return }
        
		self.title = entryTitle
		navigationController?.setNavigationBarHidden(false, animated: false)
	}
}
