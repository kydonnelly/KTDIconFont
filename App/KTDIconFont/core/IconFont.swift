//
//  Icon.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/19/20.
//

import Foundation

// Implement this protocol to represent an icon font file.
// Define the file name, first code point, and cases for each icon.
public protocol IconFont : CaseIterable, RawRepresentable {
    
    static var fontFileName: String { get }
    static var initialCodePoint: Self.RawValue { get }
    
    static var store: IconStore<Self> { get }
    
}

internal extension IconFont {
    static var store: IconStore<Self> {
        return IconStoreFactory.store(type: self)
    }
}
