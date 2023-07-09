//
//  DecodingFailureViewController.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/07/09.
//

import UIKit

class DecodingViewController: UIViewController {
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "데이터 디코딩 실패\n프로그램을 재시작해주세요."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor(.systemBackground)
        configureUI()
        setUpConstraints()
    }
    
    private func setBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
    private func configureUI() {
        view.addSubview(contentLabel)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            contentLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
