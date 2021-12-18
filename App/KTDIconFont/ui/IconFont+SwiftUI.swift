//
//  IconFont.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 12/17/21.
//

import SwiftUI

@available(iOS 13.0, *)
public extension Text {
    
    init?<AssociatedFont: IconFont>(icon: AssociatedFont, iconSize: CGFloat = 24) {
        guard let code = AssociatedFont.iconCode(for: icon) else { return nil }
        self.init(code)
        self = self.font(.custom(AssociatedFont.fontFileName, size: iconSize))
    }
    
}

@available(iOS 13.0, *)
public extension Button where Label == Text {
    
    init?<AssociatedFont: IconFont>(action: @escaping () -> Void, icon: AssociatedFont, iconSize: CGFloat = 24) {
        guard let text = Text(icon: icon, iconSize: iconSize) else {
            return nil
        }
        
        self.init(action: action, label: { text })
    }
    
}
