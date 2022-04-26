//
//  ReplaceTitles.swift
//  Expo1900
//
//  Created by 김태훈 on 2022/04/22.
//

import Foundation

struct ReplaceTitles {
    func replaceTitle() throws -> String {
        var replacedTitleText: String = ""
        let assetSeeker = AssetSeeker()
        let data: WorldFairPoster?
        
        data = try assetSeeker.matchWorldFairPosterAsset()
        
        guard let separatedData = data?.title.components(separatedBy: ExpoMagicNumberEnum.separatePoint) else {
            return ExpoMagicNumberEnum.notFoundDate
        }
        replacedTitleText += separatedData[0]
        replacedTitleText += ExpoMagicNumberEnum.newLine + ExpoMagicNumberEnum.separatePoint + separatedData[1]
        
        return replacedTitleText
    }
}
