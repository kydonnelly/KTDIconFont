//
//  UIImageView+IconFont.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/21/20.
//

import Foundation

public extension IconAppearance where Self: UIImageView {
    
    func refreshIconAppearance() {
        self.image = self.image(icon: self.icon, color: self.iconColor, backgroundColor: self.iconBackgroundColor)

        let hasCustomHighlightIcon = self.highlightedIcon != nil
        let hasCustomHighlightColor = highlightedIconColor != nil

        if hasCustomHighlightIcon || hasCustomHighlightColor {
            let highlightedIcon = hasCustomHighlightIcon ? self.highlightedIcon : self.icon
            let highlightedColor = hasCustomHighlightColor ? self.highlightedIconColor : self.iconColor
            let backgroundHighlightColor = self.highlightedIconBackgroundColor ?? self.iconBackgroundColor

            self.highlightedImage = self.image(icon: highlightedIcon, color: highlightedColor, backgroundColor: backgroundHighlightColor)
        } else {
            self.highlightedImage = nil
        }
    }
    
    private func image(icon: AssociatedIcon?, color: UIColor?, backgroundColor: UIColor) -> UIImage? {
        if let icon = icon, let color = color {
            return UIImage.image(icon: icon, color: color, backgroundColor: backgroundColor, size: self.iconSize, inset: self.iconInset, cornerRadius: 0, borderWidth: 0, borderColor: .clear)
        } else {
            return nil
        }
    }
    
}

//extension UIImageView {
//
//    @IBInspectable
//    public var iconSize: CGFloat {
//        get { return (self as IconAppearance).iconSize.width }
//        set { (self as IconAppearance).iconSize = CGSize(width: newValue, height: newValue) }
//    }
//
//    @IBInspectable
//    public var iconInset: CGFloat {
//        get { return (self as IconAppearance).iconInset }
//        set { (self as IconAppearance).iconInset = newValue }
//    }
//
//    @IBInspectable
//    public var iconName: String? {
//        get { nil }
//        set { self.setIcon(name: newValue) }
//    }
//
//    @IBInspectable
//    public var selectedIconName: String? {
//        get { nil }
//        set { self.setSelectedIcon(name: newValue) }
//    }
//
//    @IBInspectable
//    public var highlightedIconName: String? {
//        get { nil }
//        set { self.setHighlightedIcon(name: newValue) }
//    }
//
//    @IBInspectable
//    public var disabledIconName: String? {
//        get { nil }
//        set { self.setDisabledIcon(name: newValue) }
//    }
//
//}

