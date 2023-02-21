//
//  Decoder.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/21.
//

import Foundation
import UIKit

final class Decoder {
    
    private let decoder = JSONDecoder()
    private let expositionFileName = "exposition_universelle_1900"
    
    func decodeExposition() -> Exposition? {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: expositionFileName) else { return nil }
        
        do {
            let exposition: Exposition = try decoder.decode(Exposition.self, from: dataAsset.data)
            return exposition
        } catch {
            return nil
        }
    }
    
//    func decodeImage() ->  {
//        guard let dataAsset: NSDataAsset = NSDataAsset(name: "poster") else { return }
//        
//        do {
//            let image: Image = try decoder.decode(Image.self, from: dataAsset.data)
//            return image
//        } catch {
//            return nil
//        }
//    }
//    
}


