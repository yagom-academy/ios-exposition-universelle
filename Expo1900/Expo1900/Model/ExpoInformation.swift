//
//  ExpoInformation.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/13.
//

struct ExpoInformation: Decodable {
    private(set) var title: String
    private(set) var visitors: Int
    private(set) var location: String
    private(set) var duration: String
    private(set) var description: String
}
