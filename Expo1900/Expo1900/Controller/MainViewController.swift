//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - IBOulet
    @IBOutlet weak private var mainTitle: UILabel!
    @IBOutlet weak private var mainVisitor: UILabel!
    @IBOutlet weak private var mainLocation: UILabel!
    @IBOutlet weak private var mainDuration: UILabel!
    @IBOutlet weak private var mainDescription: UILabel!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeJson()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: - Method
    private func decodeJson() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        guard let expo = try? jsonDecoder.decode(InformationOfExpo.self, from: dataAsset.data) else { return }
        inputData(expo)
    }
    
    private func inputData(_ expo: InformationOfExpo) {
        mainTitle.text = expo.title
        mainVisitor.text = "방문객 : " + expo.visitorsWithComma + "명"
        mainLocation.text = "개최지 : " + expo.location
        mainDuration.text = "개최 기간 : " + expo.duration
        mainDescription.text = expo.description
    }
    
    // MARK: - IBAction
    @IBAction private func moveHeritageTableVC(_ sender: UIButton) {
        
        guard let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}


