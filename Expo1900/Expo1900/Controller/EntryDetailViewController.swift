//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by MARY, KOBE on 2023/06/30.
//

import UIKit

final class EntryDetailViewController: UIViewController {
	var koreanEntryImage: UIImage?
	var entryDescription: String?
	var entryTitle: String?
	
	@IBOutlet weak var koreaEntryImageView: UIImageView!
	@IBOutlet weak var entryDescLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		guard let koreanEntryImage = koreanEntryImage else { return }
		guard let entryDescription = entryDescription else { return }
		
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
