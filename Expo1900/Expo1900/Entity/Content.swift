//
//  Content.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/07.
//

import Foundation

struct Content {
  var data: [file]
  var info: information
}

struct file {
    var filename: String
    var idiom: String
}

struct information {
    var author: String
    var version: Int
}
