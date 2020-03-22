//
//  KTDIcons.swift
//  IconViewer
//
//  Created by Kyle Donnelly on 3/21/20.
//  Copyright © 2020 Kyle Donnelly. All rights reserved.
//

import KTDIconFont

public enum KTDIcons: unichar, IconFont {
    case notFound
    
    case pencil
    case pacman
    case stack
    case pushpin
    case bubbles
    case rocket
    case fire
    case lab
    case hipster
    case facebook
    
    public static var fontFileName: String {
        return "KTDIcons"
    }
    
    public static var initialCodePoint: unichar {
        return 0xe905
    }
}
