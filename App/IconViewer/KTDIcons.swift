//
//  KTDIcons.swift
//
//  !!! AUTO-GENERATED FILE !!!!
//  !!! DO NOT EDIT DIRECTLY !!!
//  !!! generate_icon_font.py !!
//

import KTDIconFont

public enum KTDIcons: unichar, IconFont {
    case notFound = 0x0
    
    case pencil = 0xe905
    case pacman = 0xe916
    case stack = 0xe92e
    case pushpin = 0xe946
    case bubbles2 = 0xe96d
    case rocket = 0xe9a5
    case fire = 0xe9a9
    case lab = 0xe9aa
    case hipster2 = 0xe9fa
    case facebook2 = 0xea91

    
    public static var fontFileName: String {
        return "KTDIcons"
    }
}

extension UIImageView: IconAppearance {
    public typealias AssociatedIcon = KTDIcons
}

extension UIButton: IconAppearance {
    public typealias AssociatedIcon = KTDIcons
}

extension UIBarItem: IconAppearance {
    public typealias AssociatedIcon = KTDIcons
}
