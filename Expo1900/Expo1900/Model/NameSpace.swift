//
//  NameSpace.swift
//  Expo1900
//
//  Created by 수꿍, yeton on 2022/06/20.
//
enum NameSpace: String {
    case expoInfoData = "exposition_universelle_1900"
    case expoEntryData = "items"
    case firstVCTitle = "메인"
    case bracket = "("
    case bracketWithLineBreak = "\n("
    case visitors = "방문객 : "
    case numberOfPeople = "명"
    case location = "개최지 : "
    case duration = "개최기간 : "
    case koreaEntry = "한국의 출품작"
    case koreaEntryViewControllerId = "KoreaEntryViewController"
    case transferToDetailsVCId = "transferToDetailsVC"
    case entryCellId = "entryCell"
    
    var name: String {
        switch self {
        case .expoInfoData:
            return "exposition_universelle_1900"
        case .expoEntryData:
            return "items"
        case .firstVCTitle:
            return "메인"
        case .bracket:
            return "("
        case .bracketWithLineBreak:
            return "\n("
        case .visitors:
            return "방문객 : "
        case .numberOfPeople:
            return "명"
        case .location:
            return "개최지 : "
        case .duration:
            return "개최기간 : "
        case .koreaEntry:
            return "한국의 출품작"
        case .koreaEntryViewControllerId:
            return "KoreaEntryViewController"
        case .transferToDetailsVCId:
            return "transferToDetailsVC"
        case .entryCellId:
            return "entryCell"
        }
    }
}

