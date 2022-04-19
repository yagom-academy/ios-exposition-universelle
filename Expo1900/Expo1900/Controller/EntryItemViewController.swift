//
//  EntryItemViewController.swift
//  Expo1900
//
//  Created by 김동욱 on 2022/04/15.
//

import UIKit

enum EntryItemLetter {
    static let main = "Main"
    static let entryItemViewController = "EntryItemViewController"
    static let koreaEntryList = "한국의 출품작"
    static let emptyImage = ""
}

final class EntryItemViewController: UIViewController {
    
    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var itemDiscription: UILabel!
    
    private var item: ExpositionItems?
    
    static func instance(item: ExpositionItems?) -> EntryItemViewController? {
        let entryItemViewController = UIStoryboard.init(name: EntryItemLetter.main, bundle: nil).instantiateViewController(withIdentifier: EntryItemLetter.entryItemViewController) as? EntryItemViewController
        entryItemViewController?.item = item
        return entryItemViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        navigationItem.title = item?.name
        itemDiscription.text = item?.description
        itemImage.image = UIImage(named: item?.imageName ?? EntryItemLetter.emptyImage)
    }
}
