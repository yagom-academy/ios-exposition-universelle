//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var parisExpositionInformation: ParisExpositionInformation?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moveToNextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeJSON()
        setAllData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustButtonDynamicType), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    @objc func adjustButtonDynamicType() {
        moveToNextButton.titleLabel?.adjustsFontForContentSizeCategory = true
    }
    
    @IBAction func touchUpMoveToNextButton(_ sender: UIButton) {
        guard let nextViewController = self.storyboard?.instantiateViewController(identifier: "KoreanItemListViewController") else {
            showErrorAlert(message: "알 수 없는 에러!")
            return
        }
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func decodeJSON() {
        let decoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            showErrorAlert(message: "JSON 디코딩 불가!")
            return
        }
        
        do {
            parisExpositionInformation = try decoder.decode(ParisExpositionInformation.self, from: dataAsset.data)
        } catch {
            showErrorAlert(message: "JSON 디코딩 불가!")
            return
        }
    }
    
    func setAllData() {
        titleLabel.text = parisExpositionInformation?.title ?? "정보 없음"
        visitorsLabel.text = parisExpositionInformation?.visitorsWithComma ?? "정보 없음"
        locationLabel.text = parisExpositionInformation?.location ?? "정보 없음"
        durationLabel.text = parisExpositionInformation?.duration ?? "정보 없음"
        descriptionLabel.text = parisExpositionInformation?.description ?? "정보 없음"
        
        navigationItem.title = "메인"
    }
    
    // MARK: 첫 화면, Navigation Bar 컨트롤
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let OKButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(OKButton)
        present(alert, animated: true, completion: nil)
    }
}
