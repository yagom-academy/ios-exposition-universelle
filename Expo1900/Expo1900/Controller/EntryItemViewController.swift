//
//  EntryItemViewController.swift
//  Expo1900
//
//  Created by 김동욱 on 2022/04/15.
//

import UIKit

final class EntryItemViewController: UIViewController {
    
    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var itemDiscription: UILabel!
    
    private var item: ExpositionItems?
    
    static func instance(item: ExpositionItems?) -> EntryItemViewController? {
        let entryItemViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EntryItemViewController") as? EntryItemViewController
        entryItemViewController?.item = item
        return entryItemViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        navigationItem.backButtonTitle = Exposition.koreaEntryList
        itemDiscription.text = item?.description
        itemImage.image = UIImage(named: item?.imageName ?? Exposition.emptyImage)
    }
}
