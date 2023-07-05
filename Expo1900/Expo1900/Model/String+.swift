//
//  String+.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/07/03.
//

extension String {
    func addNewLineBeforeParentheses() -> String { //
        return self.replacingOccurrences(of: "(", with: "\n(")
    }
    
    func addColon() -> String {
        return ": \(self)"
    }
    
    func addColonWithNumberOfPeople() -> String {
        return ": \(self) 명"
    }
}
