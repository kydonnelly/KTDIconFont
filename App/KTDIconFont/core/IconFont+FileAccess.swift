//
//  IconFont+FileAccess.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/19/20.
//

import Foundation

extension IconFont {
    
    public static func font(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: fontFileName, size: size) else {
            preconditionFailure("Unable to find icon font file \(fontFileName).")
        }
        
        return font
    }
    
}

// Basic wiring of IconFont enum info to the font file characters
internal extension IconFont where Self.RawValue == unichar {
    
    private func isValid() -> Bool {
        return self.rawValue != 0 && self.rawValue != Self.allCases.count - 1
    }
    
    static func iconCode(for icon: Self) -> String? {
        // First and last cases should be
        guard icon.isValid() else {
            return nil
        }
        
        let codePoint = initialCodePoint + icon.rawValue - 1
        guard let iconUnicode = UnicodeScalar(codePoint) else {
            return nil
        }
        
        return String(Character(iconUnicode))
    }
    
}
