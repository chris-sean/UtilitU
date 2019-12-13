//
//  Collection.swift
//  
//
//  Created by 薛菲 on 2019/12/14.
//

import Foundation

public extension Collection where Self.Index == Self.Indices.Iterator.Element {

    func at(_ i: Index) -> Self.Iterator.Element? {
        return indices.contains(i) ? self[i] : nil
    }
}
