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
        return ExpoInfomationNameSpace.location + self
    }
    
    var durationString: String {
        return ExpoInfomationNameSpace.duration + self
    }
}

extension Int {
    var visitorString: String {
        return ExpoInfomationNameSpace.visitors + CommaFormatter.formatNumberWithComma(self)
    }
}
