//
//  UITableViewCell+extension.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/15.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
