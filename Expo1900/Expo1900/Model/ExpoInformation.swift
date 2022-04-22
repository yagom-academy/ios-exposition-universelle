//
//  ExpoInformation.swift
//  Expo1900
//
//  Created by 김태훈 on 2022/04/22.
//

import Foundation

struct ExpoInformation {
    func retrieveDecodeData() throws -> WorldFairPoster? {
        let worldFairPosterData: WorldFairPoster?
        let assetSeeker = AssetSeeker()
        
        worldFairPosterData = try assetSeeker.matchWorldFairPosterAsset()
        
        return worldFairPosterData
    }
    
    func showVisitorLabel() throws -> String {
        let decodedData: WorldFairPoster?
        
        decodedData = try retrieveDecodeData()
        
        let visitorLabel = "방문객 : " + String(decodedData?.visitors ?? ExpoMagicNumberEnum.defaultVisitor)
        
        return visitorLabel
    }
    
    func showLocationLabel() throws -> String {
        let decodedData: WorldFairPoster?
        
        decodedData = try retrieveDecodeData()
        
        let locationLabel = "개최지 : " + (decodedData?.location ?? ExpoMagicNumberEnum.notFoundLocation)
        
        return locationLabel
    }
    
    func showDurationLabel() throws -> String {
        let decodedData: WorldFairPoster?
        
        decodedData = try retrieveDecodeData()
        
        let durationLabel = "개최 기간 : " + (decodedData?.duration ?? ExpoMagicNumberEnum.notFoundDuration)
        
        return durationLabel
    }
    
    func showDescriptionLabel() throws -> String  {
        let decodedData: WorldFairPoster?
        
        decodedData = try retrieveDecodeData()
        
        let descriptionLabel = decodedData?.description ?? ExpoMagicNumberEnum.notFoundDescriptionLabel
        
        return descriptionLabel
    }
}
