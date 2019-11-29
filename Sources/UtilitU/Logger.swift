//
//  Log.swift
//  
//
//  Created by 薛菲 on 2019/11/28.
//

import Foundation
import os.log

@available(iOS 12.0, *)
var logLevel = LogLevel.info

@available(iOS 10.0, *)
public enum LogLevel: Int {
    case info = 0
    case debug
    case error
    case fault

    var type: OSLogType {
        switch self {
        case .info:
            return .info
        case .debug:
            return .debug
        case .error:
            return .error
        case .fault:
            return .fault
        }
    }

    var tag: String {
        switch self {
        case .info:
            return "🟢"
        case .debug:
            return "🔵"
        case .error:
            return "🔴"
        case .fault:
            return "💔"
        }
    }
}

@available(iOS 12.0, *)
public func logInfo(_ message: String) {
    log(level: .info, message)
}

@available(iOS 12.0, *)
public func logInfo(_ message: StaticString) {
    log(level: .info, message)
}

@available(iOS 12.0, *)
public func logDebug(_ message: String) {
    log(level: .debug, message)
}

@available(iOS 12.0, *)
public func logDebug(_ message: StaticString) {
    log(level: .debug, message)
}

@available(iOS 12.0, *)
public func logError(_ message: String) {
    log(level: .error, message)
}

@available(iOS 12.0, *)
public func logError(_ message: StaticString) {
    log(level: .error, message)
}

@available(iOS 12.0, *)
public func logFault(_ message: String) {
    log(level: .fault, message)
}

@available(iOS 12.0, *)
public func logFault(_ message: StaticString) {
    log(level: .fault, message)
}

@available(iOS 12.0, *)
public func log(level: LogLevel, _ message: String) {
    if level.rawValue >= logLevel.rawValue {
        os_log(level.type, "%@ %@", level.tag, message)
    }
}

@available(iOS 12.0, *)
public func log(level: LogLevel, _ message: StaticString) {
    if level.rawValue >= logLevel.rawValue {
        os_log(level.type, message)
    }
}
