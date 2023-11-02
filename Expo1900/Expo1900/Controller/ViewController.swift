//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var expoTitle: UILabel!
    @IBOutlet weak var expoItem: UIImageView!
    @IBOutlet weak var expoVisitors: UILabel!
    @IBOutlet weak var expoLocation: UILabel!
    @IBOutlet weak var expoDuration: UILabel!
    @IBOutlet weak var expoDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let asset = NSDataAsset.init(name: "exposition_universelle_1900") else {
            return
        }
        
        let decoder = JSONDecoder()
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        
        
        var product: Exposition.ExpositionInfo?
        
        do {
            product = try decoder.decode(Exposition.ExpositionInfo.self, from: asset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        let visitorsCount: String = numberFormatter.string(for: product?.visitors)!
        let unwrapedLocation = (product?.location)!
        let unwrapedDuration = (product?.duration)!
        let separatedTitle = product?.title.split(separator: "(")
        let twoLineTitle = "\(separatedTitle![0])\n (\(separatedTitle![1])"
        
        
        expoTitle.text = twoLineTitle
        expoItem.image = UIImage(named: "poster")
        expoVisitors.text = "방문객 : \(visitorsCount) 명"
        expoLocation.text = "개최지: \(unwrapedLocation)"
        expoDuration.text = "개최 기간 : \(unwrapedDuration)"
        expoDescription.text = product?.description
    }
}
