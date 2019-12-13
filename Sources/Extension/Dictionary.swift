//
//  File.swift
//  
//
//  Created by 薛菲 on 2019/12/10.
//

import Foundation

open extension Dictionary where Key == String {

    func string(_ forKey: String, defaultValue: String = "") -> String {
        return self[forKey] as? String ?? defaultValue
    }

    func int(_ forKey: String, defaultValue: Int = 0) -> Int {
        return self[forKey] as? Int ?? defaultValue
    }

    func double(_ forKey: String, defaultValue: Double = 0) -> Double {
        return self[forKey] as? Double ?? defaultValue
    }

    func bool(_ forKey: String, defaultValue: Bool = false) -> Bool {
        return self[forKey] as? Bool ?? defaultValue
    }

    func array<T>(_ forKey: String, defaultValue: [T] = []) -> [T] {
        return self[forKey] as? [T] ?? defaultValue
    }

}
