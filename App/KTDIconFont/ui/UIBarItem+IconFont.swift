//
//  UIBarItem+IconFont.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/21/20.
//

import Foundation

extension IconAppearance where Self: UIBarItem {
    
    var preferredIconSize: CGSize {
        return CGSize(width: 24, height: 24)
    }

    func refreshIconAppearance() {
        if let icon = self.icon, let color = self.iconColor {
            self.image = self.image(icon: icon, color: color)
        }
    }
    
    fileprivate func image(icon: AssociatedIcon, color: UIColor) -> UIImage? {
        let iconImage = UIImage.image(icon: icon, color: color, backgroundColor: self.iconBackgroundColor, size: self.iconSize, inset: self.iconInset, cornerRadius: 0, borderWidth: self.iconBorderWidth, borderColor: self.iconBorderColor)
        
        return iconImage?.withRenderingMode(.alwaysOriginal)
    }
    
}

extension IconAppearance where Self: UITabBarItem {
    
    func refreshIconAppearance() {
        if let icon = self.icon, let color = self.iconColor {
            self.image = self.image(icon: icon, color: color)
        }
        
        if let selectedIcon = self.selectedIcon, let selectedColor = self.selectedIconColor {
            self.selectedImage = self.image(icon: selectedIcon, color: selectedColor)
        }
    }
    
}
