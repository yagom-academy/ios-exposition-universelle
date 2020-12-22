//
//  DetailViewController.swift
//  Expo1900
//
//  Created by 김호준 on 2020/12/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var detailExhibitScrollView: DetailExhibitScrollView?
    var exhibit: Exhibit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        detailExhibitScrollView = DetailExhibitScrollView()
        guard let detailExhibitScrollView = detailExhibitScrollView else {
            return
        }
        view.addSubview(detailExhibitScrollView)
        detailExhibitScrollView.configureExhibit(with: exhibit)
        setupConstraints(scrollView: detailExhibitScrollView)
    }
    
    //MARK: - Private
    private func setupConstraints(scrollView: DetailExhibitScrollView) {
        var constraints = [NSLayoutConstraint]()
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        NSLayoutConstraint.activate(constraints)
    }
}
