//
//  WorldFairPosterViewController.swift
//  Expo1900
//
//  Created by Eddy on 2022/04/14.
//

import UIKit

final class WorldFairPosterViewController: UIViewController {
    
    func decodeWorldFairPoster() {
        var array: [WorldFairPoster] = []
        let worldFairPosterData = Parser<WorldFairPoster>.parse(name: "exposition_universelle_1900")
    }
}
