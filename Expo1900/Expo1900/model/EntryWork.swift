//
//  CatalogOfExhibits.swift
//  exposition-universelle
//
//  Created by 강경 on 2021/04/05.
//

import Foundation

struct EntryWork: Decodable {
  var name: String
  var picture: String
  var summary: String
  var details: String
}
