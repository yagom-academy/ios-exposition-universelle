//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by MARY, KOBE on 2023/06/30.
//

import UIKit

final class EntryDetailViewController: UIViewController {
	@IBOutlet private weak var koreaEntryImageView: UIImageView!
	@IBOutlet private weak var entryDescLabel: UILabel!
    
	private let itemsModel: ItemsModel
	
	init?(itemsModel: ItemsModel, coder: NSCoder) {
		self.itemsModel = itemsModel
		super.init(coder: coder)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		koreaEntryImageView.image = UIImage(named: itemsModel.imageName)
		entryDescLabel.text = itemsModel.desc
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
        
		self.title = itemsModel.name
		navigationController?.setNavigationBarHidden(false, animated: false)
	}
}
