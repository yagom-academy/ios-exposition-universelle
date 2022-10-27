//
//  ExhibitionWorkListViewController + Extension.swift
//  Expo1900
//
//  Created by Som, Stone, Aaron on 2022/10/27.
//

import UIKit

extension ExhibitionWorkListViewController {
    func setUpTableView() {
        self.exhibitionWorkTableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellIdentifier)
        self.view.addSubview(self.exhibitionWorkTableView)
        
        self.exhibitionWorkTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.exhibitionWorkTableView,
                                                   attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top,
                                                   multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.exhibitionWorkTableView,
                                                   attribute: .bottom, relatedBy: .equal, toItem: self.view,
                                                   attribute: .bottom, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.exhibitionWorkTableView,
                                                   attribute: .leading, relatedBy: .equal, toItem: self.view,
                                                   attribute: .leading, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.exhibitionWorkTableView,
                                                   attribute: .trailing, relatedBy: .equal, toItem: self.view,
                                                   attribute: .trailing, multiplier: 1.0, constant: 0))
    }
}
