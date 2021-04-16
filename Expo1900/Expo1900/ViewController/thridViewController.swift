//
//  thridViewController.swift
//  Expo1900
//
//  Created by Yunhwa on 2021/04/16.
//

import UIKit

class thirdViewController: UIViewController {
    
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var desc: UILabel!
    
    private func describe() throws {
        let koreanItemData: KoreanItem?
        let jsonDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "items") else { throw ExpositionError.noFile }
        guard let itemOfDesc = try? jsonDecoder.decode(KoreanItem.self, from: dataAsset.data) else {
            throw ExpositionError.decodeFailed
        }
//        guard let itemData = koreanItemData else { return }
        desc.text = itemOfDesc.description
        imageView.image = UIImage(named: koreanItemData!.imageName)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
