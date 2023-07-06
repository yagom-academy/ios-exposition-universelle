//
//  ExpoInformationSetter.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/05.
//

extension String {
    var lineAlignment: String {
        return self.replacingOccurrences(of: "(", with: "\n(")
    }
    
    var locationString: String {
        return ExpoInformationNameSpace.location + self
    }
    
    var durationString: String {
        return ExpoInformationNameSpace.duration + self
    }
}

extension Int {
    var visitorString: String {
        return ExpoInformationNameSpace.visitors + CommaFormatter.formatNumberWithComma(self) + ExpoInformationNameSpace.numberOfPeople
    }
}
