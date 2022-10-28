//  Expo1900 - MainViewManager.swift
//  Created by Ayaan, Bella on 2022/10/27.
//  Copyright © yagom academy. All rights reserved.

import UIKit.UIImage

struct MainViewManager {
    let title: String = "메인"
    let buttonTitle: String = "한국의 출품작 보러가기"
    private let posterName: String = "poster"
    private let flagName: String = "flag"
    
    private var expositionInformation: ExpositionUniverselle? {
        didSet {
            configureInformation()
        }
    }
    private var _expositionTitle: String = ""
    private var _expositionVisitors: String = ""
    private var _expositionLocation: String = ""
    private var _expositionDuration: String = ""
    private(set) var expositionDescription: String = ""
    
    private let decimalNumberFormatter: DecimalNumberFormatter = DecimalNumberFormatter()
    
    var expositionTitle: String {
        get {
            return _expositionTitle
        }
        set {
            let roundBracket: Character = "("
            _expositionTitle = newValue.insertedLineBreak(at: roundBracket)
        }
    }
    
    var expositionVisitors: String {
        get {
            return "방문객 : \(_expositionVisitors)"
        }
        set {
            _expositionVisitors = decimalNumberFormatter.formattedNumber(newValue) ?? ""
        }
    }
    
    var expositionLocation: String {
        get {
            return "개최지 : \(_expositionLocation)"
        }
        set {
            self._expositionLocation = newValue
        }
    }
    
    var expositionDuration: String {
        get {
            return "개최 기간 : \(_expositionDuration)"
        }
        set {
            self._expositionDuration = newValue
        }
    }
    
    init() {
        fetchExpositionInformation()
    }
    
    func fetchFlagImage() -> UIImage? {
        return UIImage(named: flagName)
    }
    
    func fetchPosterImage() -> UIImage? {
        return UIImage(named: posterName)
    }
    
    private mutating func fetchExpositionInformation() {
        guard let parsedData = JSONParser.parsed(to: ExpositionUniverselle.self) else {
            return
        }
        self.expositionInformation = parsedData
    }
    
    private mutating func configureInformation() {
        guard let information = expositionInformation else {
            return
        }
        self.expositionTitle = information.title
        self.expositionVisitors = String(information.visitors)
        self.expositionDuration = information.duration
        self.expositionLocation = information.location
        self.expositionDescription = information.description
    }
}
