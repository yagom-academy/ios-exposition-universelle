//
//  FairJSONDecoder.swift
//  Expo1900
//
//  Created by Hosinging, EHD on 2021/07/10.
//

import Foundation
import UIKit

class FairJSONDecoder {
    
    //MARK: - Singleton
    static let shared = FairJSONDecoder()
    private init(){}
    
    //MARK: - Property
    let decoder: JSONDecoder = JSONDecoder()
}
