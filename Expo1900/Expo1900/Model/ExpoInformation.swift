//
//  ExpoInformation.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/13.
//

struct ExpoInformation: Decodable {
    private var title: String
    private var visitors: Int
    private var location: String
    private var duration: String
    private var description: String
    
    func getTitle() -> String {
        return title
    }
    
    func getVisitors() -> Int {
        return visitors
    }
    
    func getLocation() -> String {
        return location
    }
    
    func getDuration() -> String {
        return duration
    }
    
    func getDescription() -> String {
        return description
    }
}

