//
//  DecodeError.swift
//  Expo1900
//
//  Created by MARY, KOBE on 2023/07/03.
//

import Foundation

enum DecodeError: LocalizedError {
	case NotFoundFile
	case FailedDecode
	
	var errorDescription: String? {
		switch self {
		case .NotFoundFile:
			return "파일을 찾을 수 없습니다."
		case .FailedDecode:
			return "디코딩에 실패했습니다."
		}
	}
}
