//
//  ThirdViewController.swift
//  Expo1900
//
//  Created by 오승기 on 2021/07/08.
//

import UIKit

class ThirdViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak private var koreanHeritageImage: UIImageView!
    @IBOutlet weak private var koreanHeritageDescription: UITextView!
    
    //MARK: - Property
    var koreanHeritage: InformationOfKoreanHeritage?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        informationOfkoreanHeritage()
    }
    
    //MARK: - Method
    private func informationOfkoreanHeritage() {
        guard let koreanHeritage = koreanHeritage else {
            return
        }
        koreanHeritageImage.image = UIImage(named: koreanHeritage.imageName)
        koreanHeritageDescription.text = koreanHeritage.description
        navigationItem.title = koreanHeritage.name
    }
}
