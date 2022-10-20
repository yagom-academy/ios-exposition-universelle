//
//  String+.swift
//  Expo1900
//
//  Created by Hamo, Mene on 20/10/2022.
//

import UIKit

extension String {
    var expoVisitorInformation: String {
        return ExpoConstant.visitor + ExpoConstant.colon + self + ExpoConstant.people
    }
    
    var expoLocationInformation: String {
        return ExpoConstant.location + ExpoConstant.colon + self
    }
    
    var expoDurationInformation: String {
        return ExpoConstant.duration + ExpoConstant.colon + self
    }
    
    func createAttributed(target: String) -> NSAttributedString {
        let fontSize = ExpoConstant.mediumFont
        let attributed: NSMutableAttributedString = NSMutableAttributedString(string: self)
        let targetRange = (self as NSString).range(of: target)
        attributed.addAttribute(.font, value: fontSize, range: targetRange)
        
        return attributed
    }
    
    func applyLineBreak() -> String {
        return self.split(separator: ExpoConstant.leftBracket).joined(separator: "\n(")
    }
}
