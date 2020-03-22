//
//  icomoon.swift
//
//  !!! AUTO-GENERATED FILE !!!!
//  !!! DO NOT EDIT DIRECTLY !!!
//  !!! generate_icon_font.py !!
//

import KTDIconFont

public enum icomoon: unichar, IconFont {
    case notFound = 0x0
    
    case rocket = 0xe9a5
    case fire = 0xe9a9
    case lab = 0xe9aa

    
    public static var fontFileName: String {
        return "icomoon"
    }
}

extension UIImageView: IconAppearance {
    public typealias AssociatedIcon = icomoon
}

extension UIButton: IconAppearance {
    public typealias AssociatedIcon = icomoon
}

extension UIBarItem: IconAppearance {
    public typealias AssociatedIcon = icomoon
}
