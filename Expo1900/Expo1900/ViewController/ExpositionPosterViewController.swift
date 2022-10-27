//
//  ViewController.swift
//  ViewController
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import UIKit

final class ExpositionPosterViewController: UIViewController {
    private var exposition: Exposition?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: PosterContentView = {
        let contentView = PosterContentView()
        contentView.delegate = self
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setExposition()
        contentView.setViewData(exposition: exposition)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - posterContentDelegate
extension ExpositionPosterViewController: posterContentDelegate {
    func didTappedEntityButton() {
        let vc = KoreaEntitiesViewController()
        vc.navigationItem.title = Constant.koreanEntityNavTitle
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Data 관련 메서드
private extension ExpositionPosterViewController {
    func setExposition() {
        do {
            let jsonDecoder = JSONDecoder()
            let decodeValue: Exposition = try jsonDecoder.decode(fileName: Constant.expoFileName)
            exposition = decodeValue
        } catch {
            print(error.localizedDescription)
        }
    }
}

//MARK: - layout 설정
private extension ExpositionPosterViewController {
    func setLayout() {
        navigationController?.navigationBar.topItem?.title = Constant.mainName
        setScrollView()
        setContentView()
    }
    
    func setScrollView() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
    
    func setContentView() {
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
