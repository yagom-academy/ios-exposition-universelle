//
//  ExpoInformation.swift
//  Expo1900
//
//  Created by 김태훈 on 2022/04/22.
//

import Foundation

struct ExpoInformation {
    func checkDecodeData() throws -> WorldFairPoster? {
        let worldFairPosterData: WorldFairPoster?
        let assetSeeker = AssetSeeker()
        
        do {
            worldFairPosterData = try assetSeeker.matchWorldFairPosterAsset()
        } catch {
            throw ExpoError.decodeError
        }
        
        return worldFairPosterData
    }
    
    func updateVisitorLabel() throws -> String {
        let decodedData: WorldFairPoster?
        
        do {
            decodedData = try checkDecodeData()
        } catch {
            throw ExpoError.decodeError
        }
        
        let visitorLabel = "방문객 : " + String(decodedData?.visitors ?? ExpoMagicNumberEnum.defaultVisitor)
        
        return visitorLabel
    }
    
    func updateLocationLabel() throws -> String {
        let decodedData: WorldFairPoster?
        
        do {
            decodedData = try checkDecodeData()
        } catch {
            throw ExpoError.decodeError
        }
        
        let locationLabel = "개최지 : " + (decodedData?.location ?? ExpoMagicNumberEnum.notFoundLocation)
        
        return locationLabel
    }
    
    func updateDurationLabel() throws -> String {
        let decodedData: WorldFairPoster?
        
        do {
            decodedData = try checkDecodeData()
        } catch {
            throw ExpoError.decodeError
        }
        
        let durationLabel = "개최 기간 : " + (decodedData?.duration ?? ExpoMagicNumberEnum.notFoundDuration)
        
        return durationLabel
    }
}
