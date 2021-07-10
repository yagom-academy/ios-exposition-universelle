//
//  FairJSONDecoder.swift
//  Expo1900
//
//  Created by Hosinging, EHD on 2021/07/10.
//

import Foundation
import UIKit

class FairJSONDecoder {
    static let shared = FairJSONDecoder()
    private init(){}
    let decoder: JSONDecoder = JSONDecoder()
}
