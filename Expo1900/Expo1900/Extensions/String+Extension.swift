//
//  String+Extension.swift
//  Expo1900
//
//  Created by Seul Mac on 2021/12/15.
//

import Foundation

extension String {
    func prefix(with text: String, separatedBy: String) -> String {
        return text + separatedBy + self
    }
}
