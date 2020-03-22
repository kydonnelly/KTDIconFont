//
//  UIButton+IconFont.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/21/20.
//

import Foundation

extension IconAppearance where Self: UIButton {
    
    func refreshIconAppearance() {
        self.useIcon(self.icon, iconColor: self.iconColor, backgroundColor: self.iconBackgroundColor, state: .normal)
        self.useIcon(self.disabledIcon, iconColor: self.disabledIconColor, backgroundColor: self.disabledIconBackgroundColor, state: .disabled)
        self.useIcon(self.selectedIcon, iconColor: self.selectedIconColor, backgroundColor: self.selectedIconBackgroundColor, state: .selected)
        self.useIcon(self.highlightedIcon, iconColor: self.highlightedIconColor, backgroundColor: self.highlightedIconBackgroundColor, state: .highlighted)
    }
    
    private func useIcon(_ icon: AssociatedIcon?, iconColor: UIColor?, backgroundColor: UIColor?, state: UIControl.State) {
        guard let fallbackIcon = icon ?? self.icon, let fallbackColor = iconColor ?? self.iconColor else {
            return
        }
        
        let fallbackBackgroundColor: UIColor = backgroundColor ?? self.iconBackgroundColor
        
        let image = UIImage.image(icon: fallbackIcon,
                                  color: fallbackColor,
                                  backgroundColor: fallbackBackgroundColor,
                                  size: self.iconSize,
                                  inset: self.iconInset,
                                  cornerRadius: 0,
                                  borderWidth: self.iconBorderWidth,
                                  borderColor: self.iconBorderColor)
        
        self.setImage(image, for: state)
    }
    
}
