//
//  Expo1900 - IdentifierType.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

protocol IdentifierType {
    static var identifier: String { get }
}

extension IdentifierType {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: IdentifierType { }

extension CustomTableViewCell: IdentifierType { }
