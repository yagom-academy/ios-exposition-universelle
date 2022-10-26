//
//  DetailWorkViewContorller.swift
//  Expo1900
//
//  Created by Som, Stone, Aaron on 2022/10/20.
//

import UIKit

class DetailWorkViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    var exhibitionWork: ExhibitionWork?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDetailData()
    }

    func setUpDetailData() {
        if let imageName = exhibitionWork?.imageName,
            let assetImage = UIImage(named: imageName) {
            imageView.image = assetImage
        } else {
            imageView.image = UIImage(systemName: "xmark.seal")
        }
        
        textView.text = exhibitionWork?.desc ?? "설명 없음"
        title = exhibitionWork?.name ?? "제목 없음"
    }
}
