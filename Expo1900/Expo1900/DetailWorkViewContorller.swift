//
//  DetailWorkViewContorller.swift
//  Expo1900
//
//  Created by Som, Stone, Aaron on 2022/10/20.
//

import UIKit

class DetailWorkViewContorller: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    var exhibitionWork: ExhibitionWork?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDetailData()
    }

    func setUpDetailData() {
        imageView.image = UIImage(named: exhibitionWork?.imageName ?? "")
        textView.text = exhibitionWork?.desc ?? ""
        title = exhibitionWork?.name ?? ""
    }
}
