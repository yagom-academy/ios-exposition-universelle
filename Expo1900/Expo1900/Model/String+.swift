//
//  String+.swift
//  Expo1900
//
//  Created by jyubong, mireu
//

extension String {
    init(subTitle: String, text: String?) {
        self = "\(subTitle) : \(text ?? "")"
    }
}
