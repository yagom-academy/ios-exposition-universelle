//
//  StoryBoardName.swift
//  Expo1900
//
//  Created by hyunMac on 11/8/23.
//

enum StoryBoardName: Error {
    case DescriptionDetail
    case EntryItem
    
    var description: String {
        switch self {
        case .DescriptionDetail:
            return "DescriptionDetail"
        case .EntryItem:
            return "EntryItem"
        }
    }
}
