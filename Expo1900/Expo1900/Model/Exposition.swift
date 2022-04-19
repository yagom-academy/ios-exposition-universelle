//
//  Model.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/11.
//

import UIKit

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    static func getInfo(view: UIViewController) -> Exposition? {
        do {
            let expoInfo = try Exposition.decode(with: "exposition_universelle_1900")
            return expoInfo
        } catch let error {
            view.showAlert(for: "경고", message: "데이터 로드 오류 \n" + error.localizedDescription)
        }
        return nil
    }
}
