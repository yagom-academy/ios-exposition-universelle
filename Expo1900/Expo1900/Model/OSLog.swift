//
//  OSLog.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/13.
//

import OSLog

extension OSLog {
  private static var subsystem = Bundle.main.bundleIdentifier!
  static let ui = OSLog(subsystem: subsystem, category: "UI")
}
