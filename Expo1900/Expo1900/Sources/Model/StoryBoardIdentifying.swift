//
//  StoryBoardIdentifying.swift
//  Expo1900
//
//  Created by hyunMac on 11/9/23.
//

import UIKit

protocol StoryBoardIdentifying {
    static var reuseIdentifierr: String { get }
}

extension StoryBoardIdentifying {
    static var reuseIdentifierr: String {
        return String(String(describing: self).components(separatedBy: "ViewController")[0])
    }
}
