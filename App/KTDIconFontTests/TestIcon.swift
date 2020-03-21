//
//  TestIcon.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/21/20.
//

import KTDIconFont

public enum TestIcon: unichar, IconFont {
    case notFound
    case rocket
    case fire
    case lab
    case count
    
    public static var fontFileName: String {
        return "icomoon"
    }
    
    public static var initialCodePoint: unichar {
        return 0xe9a5
    }
}
