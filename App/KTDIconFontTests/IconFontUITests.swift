//
//  IconFontUITests.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/21/20.
//

import XCTest
@testable import KTDIconFont

extension IconFontTests {
    
    // MARK: Image Views
    
    func test_refreshIcon_bad_imageWithIconWithoutColor() {
        // Setup
        let icon = TestIcon.fire
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        // Test
        imageView.icon = icon
        
        // Verify
        XCTAssertNil(imageView.image)
    }
    
    func test_refreshIcon_bad_imageWithColorWithoutType() {
        // Setup
        let iconColor = UIColor.green
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        // Test
        imageView.iconColor = iconColor
        
        // Verify
        XCTAssertNil(imageView.image)
    }
    
    func test_refreshIcon_good_imageWithTypeAndColor() {
        // Setup
        let icon = TestIcon.fire
        let iconColor = UIColor.green
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        // Test
        imageView.icon = icon
        imageView.iconColor = iconColor
        
        // Verify
        XCTAssertNotNil(imageView.image)
    }
    
    func test_refreshIcon_good_imageWithTypeAndBackgroundColor() {
        // Setup
        let icon = TestIcon.fire
        let iconColor = UIColor.green
        let iconBackgroundColor = UIColor.purple
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        imageView.icon = icon
        imageView.iconColor = iconColor
        
        // Test
        imageView.iconBackgroundColor = iconBackgroundColor
        
        // Verify
        XCTAssertNotNil(imageView.image)
    }
    
    func test_refreshIcon_good_imageWithTypeColorAndInset() {
        // Setup
        let icon = TestIcon.fire
        let iconColor = UIColor.purple
        let iconInset: CGFloat = 3.0
        let viewSize = CGSize(width: 16, height: 16)
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: viewSize))
        
        // The image is still full size, the icon is drawn smaller.
        let expectedSize = viewSize
        
        // Test
        imageView.icon = icon
        imageView.iconColor = iconColor
        imageView.iconInset = iconInset
        
        // Verify
        guard let result = imageView.image else {
            XCTFail()
            return
        }
        XCTAssertEqual(result.size, expectedSize)
    }
    
    func test_refreshIcon_bad_imageWithTypeColorAndZeroInset() {
        // Setup
        let icon = TestIcon.fire
        let iconColor = UIColor.purple
        let iconInset: CGFloat = 0
        let iconSize = CGSize(width: 12, height: 12)
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: iconSize))
        
        // Test
        imageView.icon = icon
        imageView.iconColor = iconColor
        imageView.iconInset = iconInset
        
        // Verify
        guard let result = imageView.image else {
            XCTFail()
            return
        }
        XCTAssertEqual(result.size, iconSize)
    }
    
    func test_refreshIcon_good_imageWithTypeColorInsetAndSize() {
        // Setup
        let icon = TestIcon.fire
        let iconColor = UIColor.purple
        let iconInset: CGFloat = 3.0
        let iconSize = CGSize(width: 8, height: 8)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        
        // Test
        imageView.icon = icon
        imageView.iconColor = iconColor
        imageView.iconInset = iconInset
        imageView.iconSize = iconSize
        
        // Verify
        guard let result = imageView.image else {
            XCTFail()
            return
        }
        XCTAssertEqual(result.size, iconSize)
    }
    
    func test_refreshIcon_good_imageWithHighlightedTypeAndColor() {
        // Setup
        let icon = TestIcon.fire
        let iconColor = UIColor.purple
        let highlightedIcon = TestIcon.rocket
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        imageView.icon = icon
        imageView.iconColor = iconColor
        
        // Test
        imageView.highlightedIcon = highlightedIcon
        
        // Verify
        XCTAssertNotNil(imageView.image)
        XCTAssertNotNil(imageView.highlightedImage)
    }
    
    func test_refreshIcon_good_imageWithHighlightedTypeAndHighlightedColor() {
        // Setup
        let icon = TestIcon.fire
        let iconColor = UIColor.purple
        let highlightedIcon = TestIcon.lab
        let highlightedColor = UIColor.green

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        imageView.icon = icon
        imageView.iconColor = iconColor
        
        // Test
        imageView.highlightedIcon = highlightedIcon
        imageView.highlightedIconColor = highlightedColor
        
        // Verify
        XCTAssertNotNil(imageView.image)
        XCTAssertNotNil(imageView.highlightedImage)
    }
    
    func test_refreshIcon_good_imageWithHighlightedTypeAndHighlightedBackgroundColor() {
        // Setup
        let icon = TestIcon.fire
        let iconColor = UIColor.purple
        let highlightedIcon = TestIcon.lab
        let highlightedColor = UIColor.green
        let highlightedBackgroundColor = UIColor.red
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        imageView.icon = icon
        imageView.iconColor = iconColor
        imageView.highlightedIcon = highlightedIcon
        imageView.highlightedIconColor = highlightedColor
        
        // Test
        imageView.highlightedIconBackgroundColor = highlightedBackgroundColor
        
        // Verify
        XCTAssertNotNil(imageView.image)
        XCTAssertNotNil(imageView.highlightedImage)
    }
    
    func test_setIconName_bad_imageWithInvalidIcon() {
        // Setup
        let iconName = "~INv4l1d_k3Y~"
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        // Test
        imageView.setIcon(name: iconName)
        
        // Verify
        let result = imageView.icon
        XCTAssertNil(result)
    }
    
    func test_setIconName_good_imageIconExists() {
        // Setup
        let iconName = "lab"
        let icon = TestIcon.lab
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        XCTAssertNil(imageView.icon)
        
        // Test
        imageView.setIcon(name: iconName)
        
        // Verify
        let result = imageView.icon
        XCTAssertEqual(result, icon)
    }
    
    func test_setSelectedIconName_bad_imageWithInvalidIcon() {
        // Setup
        let iconName = "~INv4l1d_k3Y~"
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        // Test
        imageView.setSelectedIcon(name: iconName)
        
        // Verify
        let result = imageView.selectedIcon
        XCTAssertNil(result)
    }
    
    func test_setSelectedIconName_good_imageIconExists() {
        // Setup
        let iconName = "lab"
        let icon = TestIcon.lab
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        XCTAssertNil(imageView.selectedIcon)
        
        // Test
        imageView.setSelectedIcon(name: iconName)
        
        // Verify
        let result = imageView.selectedIcon
        XCTAssertEqual(result, icon)
    }
    
    // MARK: Buttons
    
    func test_refreshIconAppearance_bad_buttonWithoutColor() {
        // Setup
        let icon = TestIcon.rocket
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        // Test
        button.icon = icon
        
        // Verify
        XCTAssertNil(button.image(for: .normal))
    }
    
    func test_refreshIconAppearance_good_buttonWithIconAndColor() {
        // Setup
        let icon = TestIcon.rocket
        let iconColor = UIColor.green
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        // Test
        button.icon = icon
        button.iconColor = iconColor
        
        // Verify
        XCTAssertNotNil(button.image(for: .normal))
    }
    
    func test_refreshIconAppearance_good_buttonWithIconAndBackgroundColor() {
        // Setup
        let icon = TestIcon.rocket
        let iconColor = UIColor.green
        let iconBackgroundColor = UIColor.purple
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        button.icon = icon
        button.iconColor = iconColor
        
        // Test
        button.iconBackgroundColor = iconBackgroundColor
        
        // Verify
        XCTAssertNotNil(button.image(for: .normal))
    }
    
    func test_refreshIconAppearance_good_buttonWithIconColorAndInset() {
        // Setup
        let icon = TestIcon.rocket
        let iconColor = UIColor.purple
        let iconInset: CGFloat = 3.0
        let buttonSize = CGSize(width: 16, height: 16)
        let button = UIButton(frame: CGRect(origin: .zero, size: buttonSize))
        
        // The icon is drawn with an inset, but the image is still full size
        let expectedSize = buttonSize
        
        // Test
        button.icon = icon
        button.iconColor = iconColor
        button.iconInset = iconInset
        
        // Verify
        guard let result = button.image(for: .normal) else {
            XCTFail()
            return
        }
        XCTAssertEqual(result.size, expectedSize)
    }
    
    func test_refreshIconAppearance_bad_buttonWithIconColorAndZeroInset() {
        // Setup
        let icon = TestIcon.rocket
        let iconColor = UIColor.purple
        let iconInset: CGFloat = 0
        let buttonSize = CGSize(width: 16, height: 16)
        let button = UIButton(frame: CGRect(origin: .zero, size: buttonSize))
        
        // Test
        button.icon = icon
        button.iconColor = iconColor
        button.iconInset = iconInset
        
        // Verify
        guard let result = button.image(for: .normal) else {
            XCTFail()
            return
        }
        XCTAssertEqual(result.size, buttonSize)
    }
    
    func test_refreshIconAppearance_good_buttonWithIconColorInsetAndSize() {
        // Setup
        let icon = TestIcon.rocket
        let iconColor = UIColor.purple
        let iconInset: CGFloat = 3.0
        let iconSize = CGSize(width: 8, height: 8)
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        
        // Test
        button.icon = icon
        button.iconColor = iconColor
        button.iconInset = iconInset
        button.iconSize = iconSize
        
        // Verify
        guard let result = button.image(for: .normal) else {
            XCTFail()
            return
        }
        XCTAssertEqual(result.size, iconSize)
    }
    
    func test_refreshIconAppearance_good_buttonHighlightedIconAndColor() {
        // Setup
        let icon = TestIcon.rocket
        let iconColor = UIColor.purple
        let highlightedIcon = TestIcon.lab
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        button.icon = icon
        button.iconColor = iconColor
        
        // Test
        button.highlightedIcon = highlightedIcon
        
        // Verify
        XCTAssertNotNil(button.image(for: .normal))
        XCTAssertNotNil(button.image(for: .highlighted))
    }
    
    func test_refreshIconAppearance_good_buttonHighlightedIconAndHighlightedColor() {
        // Setup
        let icon = TestIcon.rocket
        let iconColor = UIColor.purple
        
        let highlightedColor = UIColor.green
        let highlightedIcon = TestIcon.lab
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        XCTAssertNil(button.image(for: .normal))
        XCTAssertNil(button.image(for: .highlighted))
        
        button.icon = icon
        button.iconColor = iconColor
        
        // Test
        button.highlightedIconColor = highlightedColor
        button.highlightedIcon = highlightedIcon
        
        // Verify
        XCTAssertNotNil(button.image(for: .normal))
        XCTAssertNotNil(button.image(for: .highlighted))
    }
    
    func test_refreshIconAppearance_good_buttonSelectedIconAndSelectedColor() {
        // Setup
        let icon = TestIcon.rocket
        let iconColor = UIColor.purple
        
        let selectedColor = UIColor.green
        let selectedIcon = TestIcon.lab
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        button.icon = icon
        button.iconColor = iconColor
        
        // Test
        button.selectedIconColor = selectedColor
        button.selectedIcon = selectedIcon
        
        // Verify
        XCTAssertNotNil(button.image(for: .normal))
        XCTAssertNotNil(button.image(for: .selected))
    }
    
    func test_refreshIconAppearance_good_buttonDisabledIconAndDisabledColor() {
        // Setup
        let icon = TestIcon.rocket
        let iconColor = UIColor.purple
        
        let disabledColor = UIColor.green
        let disabledIcon = TestIcon.lab
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        button.icon = icon
        button.iconColor = iconColor
        
        // Test
        button.disabledIconColor = disabledColor
        button.disabledIcon = disabledIcon
        
        // Verify
        XCTAssertNotNil(button.image(for: .normal))
        XCTAssertNotNil(button.image(for: .disabled))
    }
    
    func test_setIconName_good_invalidIcon() {
        // Setup
        let iconName = "~INv4l1d_k3Y~"
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        // Test
        button.setIcon(name: iconName)
        
        // Verify
        let result = button.icon
        XCTAssertNil(result)
    }
    
    func test_setIconName_good_validIcon() {
        // Setup
        let iconName = "fire"
        let icon = TestIcon.fire
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        XCTAssertNil(button.icon)
        
        // Test
        button.setIcon(name: iconName)
        
        // Verify
        let result = button.icon
        XCTAssertEqual(result, icon)
    }
    
    func test_setDisabledIconName_bad_invalidIcon() {
        // Setup
        let iconName = "~INv4l1d_k3Y~"
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        // Test
        button.setDisabledIcon(name: iconName)
        
        // Verify
        let result = button.disabledIcon
        XCTAssertNil(result)
    }
    
    func test_setDisabledIconName_good_validIcon() {
        // Setup
        let iconName = "fire"
        let icon = TestIcon.fire
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        XCTAssertNil(button.disabledIcon)
        
        // Test
        button.setDisabledIcon(name: iconName)
        
        // Verify
        let result = button.disabledIcon
        XCTAssertEqual(result, icon)
    }
    
    // MARK: Bar Items
    
    func test_refreshIconAppearance_bad_BarItemWithoutIconColor() {
        // Setup
        let icon = TestIcon.rocket
        let barItem = UIBarButtonItem(image: nil, style: .plain, target: nil, action: nil)
        
        // Test
        barItem.icon = icon
        
        // Verify
        XCTAssertNil(barItem.image)
    }
    
    func test_refreshIconAppearance_bad_BarItemWithoutIcon() {
        // Setup
        let iconColor = UIColor.green
        let barItem = UIBarButtonItem(image: nil, style: .plain, target: nil, action: nil)
        
        // Test
        barItem.iconColor = iconColor
        
        // Verify
        XCTAssertNil(barItem.image)
    }
    
    func test_refreshIconAppearance_good_BarItemIconAndColor() {
        // Setup
        let icon = TestIcon.rocket
        let iconColor = UIColor.green
        let barItem = UIBarButtonItem(image: nil, style: .plain, target: nil, action: nil)
        
        // Test
        barItem.icon = icon
        barItem.iconColor = iconColor
        
        // Verify
        XCTAssertNotNil(barItem.image)
    }
    
    func test_refreshIconAppearance_good_barButtonItemWithIconAndColor() {
        // Setup
        let icon = TestIcon.rocket
        let iconColor = UIColor.green
        let barItem = UIBarButtonItem(image: nil, style: .plain, target: nil, action: nil)
        
        // Test
        barItem.icon = icon
        barItem.iconColor = iconColor
        
        // Verify
        XCTAssertNotNil(barItem.image)
    }
    
    func test_refreshIconAppearance_good_barButtonItemWithZeroInset() {
        // Setup
        let icon = TestIcon.rocket
        let iconColor = UIColor.green
        let iconInset: CGFloat = 0
        let barItem = UIBarButtonItem(image: nil, style: .plain, target: nil, action: nil)
        
        // Test
        barItem.icon = icon
        barItem.iconColor = iconColor
        barItem.iconInset = iconInset
        
        // Verify
        XCTAssertNotNil(barItem.image)
    }
    
    func test_refreshIconAppearance_good_tabBarItemSelectedIconAndColor() {
        // Setup
        let icon = TestIcon.rocket
        let iconColor = UIColor.purple
        
        let selectedIcon = TestIcon.lab
        
        let barItem = UITabBarItem()
        
        barItem.icon = icon
        barItem.iconColor = iconColor
        
        // Test
        barItem.selectedIcon = selectedIcon
        
        // Verify
        XCTAssertNotNil(barItem.image)
        XCTAssertNotNil(barItem.selectedImage)
    }
    
    func test_refreshIconAppearance_good_tabBarItemSelectedIconAndSelectedColor() {
        // Setup
        let icon = TestIcon.rocket
        let iconColor = UIColor.purple
        
        let selectedColor = UIColor.green
        let selectedIcon = TestIcon.lab
        
        let barItem = UITabBarItem()
        
        XCTAssertNil(barItem.image)
        XCTAssertNil(barItem.selectedImage)
        
        barItem.icon = icon
        barItem.iconColor = iconColor
        
        // Test
        barItem.selectedIconColor = selectedColor
        barItem.selectedIcon = selectedIcon
        
        // Verify
        XCTAssertNotNil(barItem.image)
        XCTAssertNotNil(barItem.selectedImage)
    }
    
    func test_setIconName_bad_barButtonItem() {
        // Setup
        let iconName = "~INv4l1d_k3Y~"
        let barItem = UIBarButtonItem(image: nil, style: .plain, target: nil, action: nil)
        
        // Test
        barItem.setIcon(name: iconName)
        
        // Verify
        let result = barItem.icon
        XCTAssertNil(result)
    }
    
    func test_setIconName_good_barButtonItem() {
        // Setup
        let iconName = "fire"
        let icon = TestIcon.fire
        let barItem = UIBarButtonItem(image: nil, style: .plain, target: nil, action: nil)
        
        XCTAssertNil(barItem.icon)
        
        // Test
        barItem.setIcon(name: iconName)
        
        // Verify
        let result = barItem.icon
        XCTAssertEqual(result, icon)
    }
    
    func test_setSelectedIconName_bad_tabBarItem() {
        // Setup
        let iconName = "~INv4l1d_k3Y~"
        let barItem = UITabBarItem()
        
        // Test
        barItem.setSelectedIcon(name: iconName)
        
        // Verify
        let result = barItem.icon
        XCTAssertNil(result)
    }
    
    func test_setSelectedIconName_good_tabBarItem() {
        // Setup
        let iconName = "fire"
        let icon = TestIcon.fire
        let barItem = UITabBarItem()
        
        XCTAssertEqual(barItem.selectedIcon, nil)
        
        // Test
        barItem.setSelectedIcon(name: iconName)
        
        // Verify
        let result = barItem.selectedIcon
        XCTAssertEqual(result, icon)
    }
    
}
