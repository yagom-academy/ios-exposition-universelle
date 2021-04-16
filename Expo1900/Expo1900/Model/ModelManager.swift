//
//  ModelManager.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/15.
//

import Foundation

final class ModelManager {
    static let shared = ModelManager()
    
    var koreaEntrys: [StateEntry] = []
    var detailEntry: StateEntry?
    var expoData: Expo?
    
    private init() { }
}
