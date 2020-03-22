//
//  TestIcon.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/21/20.
//

@testable import KTDIconFont

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

extension UIButton : IconAppearance {
    public typealias AssociatedIcon = TestIcon
}

extension UIImageView : IconAppearance {
    public typealias AssociatedIcon = TestIcon
}

extension UIBarItem : IconAppearance {
    public typealias AssociatedIcon = TestIcon
}
