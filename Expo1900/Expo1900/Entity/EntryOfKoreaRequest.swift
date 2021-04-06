//
//  EntryOfKoreaRequest.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/06.
//

import Foundation

struct EntryOfKoreaRequest : Decodable {
    var listOfEntry : [Entry]
}

struct Entry : Decodable {
    var title : String
    var photo : String
    var venurPeriod : String
    var content : String
}
