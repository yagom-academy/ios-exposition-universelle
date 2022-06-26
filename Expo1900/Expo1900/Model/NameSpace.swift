//
//  NameSpace.swift
//  Expo1900
//
//  Created by 수꿍, yeton on 2022/06/20.
//
enum NameSpace: String {
    case expoInfoData = "exposition_universelle_1900"
    case expoEntryData = "items"
    case koreaEntryViewControllerId = "KoreaEntryViewController"
    case transferToDetailsVCId = "transferToDetailsVC"
    case entryCellId = "entryCell"
    
    var name: String {
        rawValue
    }
}

