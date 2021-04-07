//
//  Content.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/07.
//

import Foundation

struct Content {
  var data: [File]
  var info: Information
}

struct File {
    var filename: String
    var idiom: String
}

struct Information {
    var author: String
    var version: Int
}
