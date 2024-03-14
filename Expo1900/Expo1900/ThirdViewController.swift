//
//  ThirdViewController.swift
//  Expo1900
//
//  Created by JIWOONG on 2024/03/15.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let test = UILabel()
        view.backgroundColor = .white // 배경색
        view.addSubview(test)
        test.text = "Second View is here👋" // test를 위해서 출력할 라벨
        test.translatesAutoresizingMaskIntoConstraints = false
        test.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        test.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
