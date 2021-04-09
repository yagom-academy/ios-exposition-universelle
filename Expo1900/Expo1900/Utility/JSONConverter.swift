//
//  JSONConverter.swift
//  Expo1900
//
//  Created by 김찬우 on 2021/04/09.
//

import Foundation
import UIKit

func extractData(assetName: String) -> NSDataAsset? {
    guard let dataAsset = NSDataAsset.init(name: assetName) else { return nil }
    return dataAsset
}
