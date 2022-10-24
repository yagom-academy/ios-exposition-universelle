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
    let contentView: PosterContentView = {
        let contentView = PosterContentView()
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exposition = decode()
        setLayout()
        contentView.delegate = self
        contentView.setViewData(exposition: exposition)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
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

extension ExpositionPosterViewController: posterContentDelegate {
    func didTappedEntityButton() {
        let vc = KoreaEntitiesViewController()
        
        navigationController?.pushViewController(vc, animated: true)
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
