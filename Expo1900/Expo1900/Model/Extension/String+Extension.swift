//
//  String+Extension.swift
//  Created by sunnyCookie, Wonbi
//

import UIKit

extension String {
    func applyHangulAttribute() -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        
        if #available(iOS 14.0, *) {
            paragraphStyle.lineBreakStrategy = .hangulWordPriority
        }
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .body),
            .paragraphStyle: paragraphStyle
        ]
        
        return NSAttributedString(string: self, attributes: attributes)
    }
}
