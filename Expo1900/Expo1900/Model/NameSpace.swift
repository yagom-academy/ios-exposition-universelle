//
//  NameSpace.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/22.
//

enum ExpoNameSpace: String {
    case koreaEntry = "한국의 출품작"
    case koreaEntryJSONFileName = "items"
    case expoInformationJSONFileName = "exposition_universelle_1900"
    case firstViewcontrollerTitle = "메인"
    case expoPoster = "poster"
    case howMany = "방문객 : "
    case empty = ""
    case visit = "명"
    case `where` = "개최지 : "
    case howlong = "개최 기간 : "
    case entryListIdentifier = "EntryList"
    case descriptionIdentifier = "Description"
    case cellIdentifier = "customCell"

    var name: String {
        switch self {
        case .koreaEntry:
            return "한국의 출품작"
        case .koreaEntryJSONFileName:
            return "items"
        case .expoInformationJSONFileName:
            return "exposition_universelle_1900"
        case .firstViewcontrollerTitle:
            return "메인"
        case .expoPoster:
            return "poster"
        case .howMany:
            return "방문객 : "
        case .empty:
            return ""
        case .visit:
            return "명"
        case .where:
            return "개최지 : "
        case .howlong:
            return "개최 기간 : "
        case .entryListIdentifier:
            return "EntryList"
        case .descriptionIdentifier:
            return "Description"
        case .cellIdentifier:
            return "customCell"
        }
    }
}
