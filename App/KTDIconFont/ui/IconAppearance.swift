//
//  IconAppearance.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/21/20.
//

import Foundation

// Protocol to easily display icons
internal protocol IconAppearance : class, AssociativeObject {
    
    associatedtype AssociatedIcon: IconFont
    
    func refreshIconAppearance()
    var preferredIconSize: CGSize { get }
    
}

// By default, icons will aspect-fit the owner's coordinate space
extension IconAppearance where Self: UICoordinateSpace {
    
    var preferredIconSize: CGSize {
        return self.bounds.size
    }
    
}

enum AssociatedObjectKeys {
    // Set one of these to control the icon's display size.
    // The inset is applied to preferredIconSize.
    fileprivate static var IconSizeKey: UInt8 = 0
    fileprivate static var IconInsetKey: UInt8 = 0
    
    // Icon to display for standard states
    fileprivate static var IconKey: UInt8 = 0
    fileprivate static var HighlighedIconKey: UInt8 = 0
    fileprivate static var SelectedIconKey: UInt8 = 0
    fileprivate static var DisabledIconKey: UInt8 = 0
    
    // Color to display the icon for standard states
    fileprivate static var IconColorKey: UInt8 = 0
    fileprivate static var HighlightedIconColorKey: UInt8 = 0
    fileprivate static var SelectedIconColorKey: UInt8 = 0
    fileprivate static var DisabledIconColorKey: UInt8 = 0
    
    // Background color of the displayed icon for standard states.
    // NOTE: This is different than setting the view's background.
    //   The icon may be inset or inlined with text, for example.
    fileprivate static var IconBackgroundColorKey: UInt8 = 0
    fileprivate static var HighlightedIconBackgroundColorKey: UInt8 = 0
    fileprivate static var SelectedIconBackgroundColorKey: UInt8 = 0
    fileprivate static var DisabledIconBackgroundColorKey: UInt8 = 0
    
    // Show a border around the displayed icon.
    // NOTE: This is different than setting the view's border.
    fileprivate static var IconBorderColorKey: UInt8 = 0
    fileprivate static var IconBorderWidthKey: UInt8 = 0
}

extension IconAppearance {
    
    private func setAndRefresh(_ newValue: AssociatedIcon?, key: UnsafePointer<UInt8>) {
        setIcon(newValue, key: key)
        refreshIconAppearance()
    }
    
    private func setAndRefresh(_ newValue: AnyObject?, key: UnsafePointer<UInt8>) {
        setValue(newValue, key: key)
        refreshIconAppearance()
    }
    
    internal var iconSize: CGSize {
        get {
            if let value: NSValue = getValue(key: &AssociatedObjectKeys.IconSizeKey) {
                return value.cgSizeValue
            } else {
                return self.preferredIconSize
            }
        }
        set {
            setAndRefresh(NSValue(cgSize: newValue), key: &AssociatedObjectKeys.IconSizeKey)
        }
    }
    
    internal var iconInset: CGFloat {
        get {
            if let value: NSNumber = getValue(key: &AssociatedObjectKeys.IconInsetKey) {
                return CGFloat(value.doubleValue)
            } else {
                return 1.0 / UIScreen.main.scale
            }
        }
        set {
            setAndRefresh(NSNumber(value: Double(newValue)), key: &AssociatedObjectKeys.IconInsetKey)
        }
    }
    
    internal var icon: AssociatedIcon? {
        get { getIcon(key: &AssociatedObjectKeys.IconKey) }
        set { setAndRefresh(newValue, key: &AssociatedObjectKeys.IconKey) }
    }
    
    internal var highlightedIcon: AssociatedIcon? {
        get { getIcon(key: &AssociatedObjectKeys.HighlighedIconKey) }
        set { setAndRefresh(newValue, key: &AssociatedObjectKeys.HighlighedIconKey) }
    }
    
    internal var selectedIcon: AssociatedIcon? {
        get { getIcon(key: &AssociatedObjectKeys.SelectedIconKey) }
        set { setAndRefresh(newValue, key: &AssociatedObjectKeys.SelectedIconKey) }
    }
    
    internal var disabledIcon: AssociatedIcon? {
        get { getIcon(key: &AssociatedObjectKeys.DisabledIconKey) }
        set { setAndRefresh(newValue, key: &AssociatedObjectKeys.DisabledIconKey) }
    }
    
    internal var iconColor: UIColor? {
        get { getValue(key: &AssociatedObjectKeys.IconColorKey) }
        set { setAndRefresh(newValue, key: &AssociatedObjectKeys.IconColorKey) }
    }
    
    internal var highlightedIconColor: UIColor? {
        get { getValue(key: &AssociatedObjectKeys.HighlightedIconColorKey) }
        set { setAndRefresh(newValue, key: &AssociatedObjectKeys.HighlightedIconColorKey) }
    }
    
    internal var selectedIconColor: UIColor? {
        get { getValue(key: &AssociatedObjectKeys.SelectedIconColorKey) }
        set { setAndRefresh(newValue, key: &AssociatedObjectKeys.SelectedIconColorKey) }
    }
    
    internal var disabledIconColor: UIColor? {
        get { getValue(key: &AssociatedObjectKeys.DisabledIconColorKey) }
        set { setAndRefresh(newValue, key: &AssociatedObjectKeys.DisabledIconColorKey) }
    }
    
    internal var iconBackgroundColor: UIColor {
        get { getValue(key: &AssociatedObjectKeys.IconBackgroundColorKey) { .clear } }
        set { setAndRefresh(newValue, key: &AssociatedObjectKeys.IconBackgroundColorKey) }
    }
    
    internal var highlightedIconBackgroundColor: UIColor? {
        get { getValue(key: &AssociatedObjectKeys.HighlightedIconBackgroundColorKey) }
        set { setAndRefresh(newValue, key: &AssociatedObjectKeys.HighlightedIconBackgroundColorKey) }
    }
    
    internal var selectedIconBackgroundColor: UIColor? {
        get { getValue(key: &AssociatedObjectKeys.SelectedIconBackgroundColorKey) }
        set { setAndRefresh(newValue, key: &AssociatedObjectKeys.SelectedIconBackgroundColorKey) }
    }
    
    internal var disabledIconBackgroundColor: UIColor? {
        get { getValue(key: &AssociatedObjectKeys.DisabledIconBackgroundColorKey) }
        set { setAndRefresh(newValue, key: &AssociatedObjectKeys.DisabledIconBackgroundColorKey) }
    }
    
    internal var iconBorderColor: UIColor {
        get { getValue(key: &AssociatedObjectKeys.IconBorderColorKey) { .clear } }
        set { setAndRefresh(newValue, key: &AssociatedObjectKeys.IconBorderColorKey) }
    }
    
    internal var iconBorderWidth: CGFloat {
        get {
            if let value: NSNumber = getValue(key: &AssociatedObjectKeys.IconBorderWidthKey) {
                return CGFloat(value.doubleValue)
            } else {
                return 0
            }
        }
        set {
            setAndRefresh(NSNumber(value: Double(newValue)), key: &AssociatedObjectKeys.IconBorderWidthKey)
        }
    }
    
}

extension IconAppearance {
    
    internal func setIcon(name: String) {
        self.icon = AssociatedIcon.store.icon(name: name)
    }
    
    internal func setHighlightedIcon(name: String) {
        self.highlightedIcon = AssociatedIcon.store.icon(name: name)
    }
    
    internal func setSelectedIcon(name: String) {
        self.selectedIcon = AssociatedIcon.store.icon(name: name)
    }
    
    internal func setDisabledIcon(name: String) {
        self.disabledIcon = AssociatedIcon.store.icon(name: name)
    }
    
}
