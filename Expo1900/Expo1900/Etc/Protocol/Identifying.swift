//
//  Identifying.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/23.
//
import UIKit

protocol Identifying {
    static var identifier: String { get }
}

extension Identifying {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Identifying { }

extension UIViewController: Identifying { }
