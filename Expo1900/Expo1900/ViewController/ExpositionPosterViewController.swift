//
//  ViewController.swift
//  ViewController
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import UIKit

class ExpositionPosterViewController: UIViewController {
    var exposition: Exposition?
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // MARK: - 빼기
    let contentView = PosterContentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exposition = decode()
        setLayout()
        contentView.setViewData(exposition: exposition)
    }
    
    private func decode() -> Exposition? {
        let jsonDecoder = JSONDecoder()
        let json = NSDataAsset(name: "exposition_universelle_1900")
        
        guard let result = try? jsonDecoder.decode(Exposition.self, from: json?.data ?? Data()) else {
            return nil
        }
        
        return result
    }
}

//MARK: - layout 설정
extension ExpositionPosterViewController {
    private func setLayout() {
        setScrollView()
        setContentView()
    }
    
    private func setScrollView() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
    
    private func setContentView() {
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

}
