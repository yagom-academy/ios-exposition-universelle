//
//  ExpoMenuViewController.swift
//  Expo1900
//
//  Created by 유한석 on 2022/06/17.
//
/*
- iboutlet 연결
- jsondata 디코딩해서 저장 >> 완료
- ui 업데이트
- delegate구현
- datasource 구현
*/
//

import UIKit

class ExpoMenuViewController: UIViewController {
    var expoItemList: [ExpoItemElement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setExpositionData()
    }
    
    private func setExpositionData() {
        let expoItemList = loadJsonData(type: Array<ExpoItemElement>.self, "items", "json")
        self.expoItemList = expoItemList
    }
}
