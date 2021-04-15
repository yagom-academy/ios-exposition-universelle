//
//  DefaultValues.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/12.
//

import Foundation
import UIKit

enum DefaultJSONValues {
    static let text = "Not Found"
    static let number = 0
}

enum ExpoAffix {
    enum Prefix {
        static let visitors = "방문객 : "
        static let location = "개최지 : "
        static let duration = "개최기간 : "
    }

    enum Suffix {
        static let visitors = " 명"
    }
}

enum ViewConstant {
    static let scrollBarWidth: CGFloat = 10
}
