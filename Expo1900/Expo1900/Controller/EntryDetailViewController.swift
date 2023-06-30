//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by Minseong Kang on 2023/06/30.
//

import UIKit

class EntryDetailViewController: UIViewController {
	var koreanEntryImageName: String?
	var entryDescription: String?
	var entryTitle: String?
	
	@IBOutlet weak var koreaEntryImageView: UIImageView!
	@IBOutlet weak var entryDescLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		guard let koreanEntryImageName = koreanEntryImageName else { return }
		guard let entryDescription = entryDescription else { return }
		
		koreaEntryImageView.image = UIImage(named: koreanEntryImageName)
		entryDescLabel.text = entryDescription
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		guard let entryTitle = entryTitle else { return }
		self.title = entryTitle
		navigationController?.setNavigationBarHidden(false, animated: false)
	}
}
