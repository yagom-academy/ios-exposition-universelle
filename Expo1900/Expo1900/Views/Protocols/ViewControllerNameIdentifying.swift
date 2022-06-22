//
//  ViewControllerIdentifiable.swift
//  Expo1900
//
//  Created by Gordon Choi on 2022/06/22.
//

protocol ViewControllerNameIdentifying {
    static var identifier: String { get }
}

extension ViewControllerNameIdentifying {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
