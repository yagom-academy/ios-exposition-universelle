//
//  DateFormatter+.swift
//  Expo1900

import Foundation

extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM. dd"
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(secondsFromGMT: timezone)
        return formatter
    }()
    
    static let dateToStringFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter
    }()
}
