//
//  AssetSeeker.swift
//  Expo1900
//
//  Created by Eddy on 2022/04/19.
//

import Foundation

struct AssetSeeker {

    func matchKoreaEntryDetailAsset() throws -> [KoreaEntryDetail] {
        guard let unwrappedKoreaEntryData = Parser<[KoreaEntryDetail]>.parse(name: "items") else {
            throw ExpoError.emptyValueError
        }
        return unwrappedKoreaEntryData
    }
    
    func matchWorldFairPosterAsset() throws -> WorldFairPoster {
        guard let unwrppaedWorldFairPosterData = Parser<WorldFairPoster>.parse(name: "exposition_universelle_1900") else {
            throw ExpoError.emptyValueError
        }
        return unwrppaedWorldFairPosterData
    }
}
