//
//  Decoder.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/21.
//

import UIKit

final class Decoder {
    
    private let decoder = JSONDecoder()
    private let expositionFileName = "exposition_universelle_1900"
    private let exhibitItemFileName = "items"

    func decodeExposition() -> Exposition? {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: expositionFileName) else { return nil }
        
        do {
            let exposition: Exposition = try decoder.decode(Exposition.self, from: dataAsset.data)
            return exposition
        } catch {
            return nil
        }
    }
    
    func decodeExhibitItem() -> [ExhibitItem]? {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: exhibitItemFileName) else { return nil }
        
        do {
            let exhibitItems: [ExhibitItem] = try decoder.decode([ExhibitItem].self, from: dataAsset.data)
            return exhibitItems
        } catch {
            return nil
        }
    }
}
