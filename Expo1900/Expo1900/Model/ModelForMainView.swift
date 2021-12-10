//
//  ModelForMainView.swift
//  Expo1900
//
//  Created by Siwon Kim on 2021/12/10.
//

import UIKit

struct ModelForMainView {
    var title: String
    var image: UIImage
    var visitors: String
    var location: String
    var duration: String
    var description: String
    
    init(title: String = "", image: UIImage = UIImage(), visitors: String = "", location: String = "", duration: String = "", description: String = "") {
        self.title = title
        self.image = image
        self.visitors = visitors
        self.location = location
        self.duration = duration
        self.description = description
    }
    
    //데이터를 가공해서 리턴
    mutating func setUpData(with data: Exposition) {
        title = data.title.replacingOccurrences(of: "(", with: "\n(")
        visitors = "방문객: " + data.visitors.description + "명"
        location = "개최지: " + data.location
        duration = data.duration
        description = data.description
        image = UIImage(named: "poster")!
    }
    
}
