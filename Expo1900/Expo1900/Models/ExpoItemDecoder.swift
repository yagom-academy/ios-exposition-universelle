//
//  ExpoItemDecoder.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/24.
//

import UIKit

struct ExpoItemDecoder {
    private(set) var expoItems: [ExpoItem] = []
    
    mutating func decodeData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            expoItems = try jsonDecoder.decode([ExpoItem].self, from: dataAsset.data)
        } catch {
            let alertController = UIAlertController(title: "에러 발생",
                                                    message: "데이터를 불러오지 못했습니다.",
                                                    preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)

            alertController.addAction(okAction)
            
            let rootViewController = UIApplication.shared.windows.first?.rootViewController
            rootViewController?.present(alertController, animated: true)
        }
    }
}
