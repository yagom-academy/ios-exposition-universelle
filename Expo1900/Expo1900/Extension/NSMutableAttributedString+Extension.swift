//
//  NSMutableAttributedString+Extension.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/28.
//

import UIKit

extension NSMutableAttributedString {
    func makeBigText(string: String) -> NSMutableAttributedString {
        let metric = UIFontMetrics(forTextStyle: .body)
        let font = metric.scaledFont(for: UIFont.systemFont(ofSize: 17))
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        append(NSAttributedString(string: string, attributes: attributes))
        
        return self
    }
    
    func makeNormalText(string: String) -> NSMutableAttributedString {
        let metric = UIFontMetrics(forTextStyle: .body)
        let font = metric.scaledFont(for: UIFont.systemFont(ofSize: 17))
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        append(NSAttributedString(string: string, attributes: attributes))
        
        return self
    }
}
