//
//  JSONParser.swift
//  Expo1900
//
//  Created by duckbok on 2021/04/09.
//

import Foundation
import UIKit

enum JSONParser {
    static func extractData(by dataName: String) -> NSDataAsset? {
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: dataName) else { return nil }
        
        return dataAsset
    }
}
