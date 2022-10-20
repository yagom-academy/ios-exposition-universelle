//
//  String+.swift
//  Expo1900
//
//  Created by Hamo, Mene on 20/10/2022.
//

import UIKit

extension String {
    func createAttributed(target: String) -> NSAttributedString {
        let fontSize = UIFont.systemFont(ofSize: 20)
        let attributed: NSMutableAttributedString = NSMutableAttributedString(string: self)
        let targetRange = (self as NSString).range(of: target)
        attributed.addAttribute(.font, value: fontSize, range: targetRange)
        
        return attributed
    }
}
