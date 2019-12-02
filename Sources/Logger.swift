//
//  Log.swift
//  
//
//  Created by 薛菲 on 2019/11/28.
//

import Foundation
import os.log

public var logLevel = LogLevel.info

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

public func logInfo(_ message: String) {
    log(level: .info, message)
}

public func logInfo(_ message: StaticString) {
    log(level: .info, message)
}

public func logDebug(_ message: String) {
    log(level: .debug, message)
}

public func logDebug(_ message: StaticString) {
    log(level: .debug, message)
}

public func logError(_ message: String) {
    log(level: .error, message)
}

public func logError(_ message: StaticString) {
    log(level: .error, message)
}

public func logFault(_ message: String) {
    log(level: .fault, message)
}

public func logFault(_ message: StaticString) {
    log(level: .fault, message)
}

public func log(level: LogLevel, _ message: String) {
    if level.rawValue >= logLevel.rawValue {
        os_log(level.type, "%@ %@", level.tag, message)
    }
}

public func log(level: LogLevel, _ message: StaticString) {
    if level.rawValue >= logLevel.rawValue {
        os_log(level.type, message)
    }
}
