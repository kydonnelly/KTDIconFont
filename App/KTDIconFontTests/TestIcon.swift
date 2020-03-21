//
//  TestIcon.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/21/20.
//

import Foundation

enum TestIcon: unichar, IconFont {
    case notFound
    case rocket
    case fire
    case lab
    case count
    
    static var fontFileName: String {
        return "icomoon"
    }
    
    static var initialCodePoint: unichar {
        return 0xe9a5
    }
}
