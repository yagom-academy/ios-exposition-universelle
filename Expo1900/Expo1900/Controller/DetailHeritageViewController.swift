//
//  ThirdViewController.swift
//  Expo1900
//
//  Created by 오승기 on 2021/07/08.
//

import UIKit

class DetailHeritageViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak private var koreanHeritageImage: UIImageView!
    @IBOutlet weak private var koreanHeritageDescription: UILabel!
    
    //MARK: - Property
    private var koreanHeritage: InformationOfKoreanHeritage?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showInformationOfkoreanHeritage()
    }
    
    //MARK: - Method
    func configure(koreanHeritage: InformationOfKoreanHeritage) {
        self.koreanHeritage = koreanHeritage
    }
    
    private func showInformationOfkoreanHeritage() {
        guard let koreanHeritage = koreanHeritage else {
            return
        }
        koreanHeritageImage.image = UIImage(named: koreanHeritage.imageName)
        koreanHeritageDescription.text = koreanHeritage.description
        navigationItem.title = koreanHeritage.name
    }
}
