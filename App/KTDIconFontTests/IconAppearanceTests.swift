//
//  IconAppearanceTests.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/21/20.
//

import XCTest
@testable import KTDIconFont

class IconAppearanceTests : XCTestCase {

    func test_IconAppearance_good_preferredIconSize() {
        // Setup
        let size = CGSize(width: 4, height: 8)
        let testView = UIImageView(frame: CGRect(origin: .zero, size: size))
        
        // Test
        let iconSize = testView.iconSize
        
        // Verify
        XCTAssertEqual(iconSize, size)
    }

    func test_IconAppearance_good_setIconSize() {
        // Setup
        let iconSize = CGSize(width: 2, height: 4)
        let viewSize = CGSize(width: 4, height: 8)
        let testView = UIImageView(frame: CGRect(origin: .zero, size: viewSize))
        XCTAssertEqual(testView.iconSize, viewSize)
        
        // Test
        testView.iconSize = iconSize
        
        // Verify
        let result = testView.iconSize
        XCTAssertEqual(iconSize, result)
    }

    func test_IconAppearance_good_defaultIconInset() {
        // Setup
        let size = CGSize(width: 4, height: 8)
        let testView = UIImageView(frame: CGRect(origin: .zero, size: size))
        let expectedDefaultInset = 1.0 / UIScreen.main.scale
        
        // Test
        let iconInset = testView.iconInset
        
        // Verify
        XCTAssertEqual(iconInset, expectedDefaultInset)
    }

    func test_IconAppearance_good_setIconInset() {
        // Setup
        let iconInset: CGFloat = 2.0
        let viewSize = CGSize(width: 4, height: 8)
        let testView = UIImageView(frame: CGRect(origin: .zero, size: viewSize))
        
        // Test
        testView.iconInset = iconInset
        
        // Verify
        let result = testView.iconInset
        XCTAssertEqual(iconInset, result)
    }

    func test_IconAppearance_good_noIconType() {
        // Setup
        let testView = UIImageView(frame: .zero)
        
        // Test
        let icon = testView.icon
        
        // Verify
        XCTAssertNil(icon)
    }

    func test_IconAppearance_good_setIconType() {
        // Setup
        let icon = TestIcon.fire
        let testView = UIImageView(frame: .zero)
        
        // Test
        testView.icon = icon
        
        // Verify
        let result = testView.icon
        XCTAssertEqual(icon, result)
    }

    func test_IconAppearance_good_noSelectedIconType() {
        // Setup
        let normalIcon = TestIcon.fire
        let testView = UIImageView(frame: .zero)
        testView.icon = normalIcon
        
        // Test
        let result = testView.selectedIcon
        
        // Verify
        XCTAssertNil(result)
    }

    func test_IconAppearance_good_setSelectedIconType() {
        // Setup
        let normalIcon = TestIcon.fire
        let selectedIcon = TestIcon.rocket
        let testView = UIImageView(frame: .zero)
        testView.icon = normalIcon
        XCTAssertNotNil(testView.icon)
        XCTAssertNil(testView.selectedIcon)
        
        // Test
        testView.selectedIcon = selectedIcon
        
        // Verify
        let result = testView.selectedIcon
        XCTAssertEqual(selectedIcon, result)
    }

    func test_IconAppearance_good_noIconColor() {
        // Setup
        let testView = UIImageView(frame: .zero)
        
        // Test
        let result = testView.iconColor
        
        // Verify
        XCTAssertNil(result)
    }

    func test_IconAppearance_good_setIconColor() {
        // Setup
        let iconColor = UIColor.purple
        let testView = UIImageView(frame: .zero)
        
        // Test
        testView.iconColor = iconColor
        
        // Verify
        let result = testView.iconColor
        XCTAssertEqual(iconColor, result)
    }

    func test_IconAppearance_good_noIconBackgroundColor() {
        // Setup
        let testView = UIImageView(frame: .zero)
        let defaultBackgroundColor = UIColor.clear
        
        // Test
        let result = testView.iconBackgroundColor
        
        // Verify
        XCTAssertEqual(result, defaultBackgroundColor)
    }

    func test_IconAppearance_good_setIconBackgroundColor() {
        // Setup
        let iconBackgroundColor = UIColor.yellow
        let testView = UIImageView(frame: .zero)
        
        // Test
        testView.iconBackgroundColor = iconBackgroundColor
        
        // Verify
        let result = testView.iconBackgroundColor
        XCTAssertEqual(iconBackgroundColor, result)
    }

    func test_IconAppearance_good_noBorderWidth() {
        // Setup
        let testView = UIImageView(frame: .zero)
        let defaultBorderWidth: CGFloat = 0
        
        // Test
        let result = testView.iconBorderWidth
        
        // Verify
        XCTAssertEqual(result, defaultBorderWidth)
    }

    func test_IconAppearance_good_setBorderWidth() {
        // Setup
        let borderWidth: CGFloat = 4.0
        let testView = UIImageView(frame: .zero)
        
        // Test
        testView.iconBorderWidth = borderWidth
        
        // Verify
        let result = testView.iconBorderWidth
        XCTAssertEqual(borderWidth, result)
        XCTAssertEqual(testView.layer.borderWidth, 0)
    }

    func test_IconAppearance_good_noIconBorderColor() {
        // Setup
        let defaultIconBorderColor = UIColor.clear
        let viewBorderColor = UIColor.green.cgColor
        let testView = UIImageView(frame: .zero)
        testView.layer.borderColor = viewBorderColor
        
        // Test
        let result = testView.iconBorderColor
        
        // Verify
        XCTAssertEqual(result, defaultIconBorderColor)
        XCTAssertEqual(testView.layer.borderColor, viewBorderColor)
    }

    func test_IconAppearance_good_setIconBorderColor() {
        // Setup
        let iconBorderColor = UIColor.red
        let viewBorderColor = UIColor.green.cgColor
        let testView = UIImageView(frame: .zero)
        testView.layer.borderColor = viewBorderColor
        
        // Test
        testView.iconBorderColor = iconBorderColor
        
        // Verify
        let result = testView.iconBorderColor
        XCTAssertEqual(iconBorderColor, result)
        XCTAssertEqual(testView.layer.borderColor, viewBorderColor)
    }
    
    func test_UIImage_good_imageForIcon() {
        // Setup
        let iconSize = CGSize(width: 4, height: 6)
        let icon = TestIcon.fire
        let iconColor = UIColor.red
        let iconBackgroundColor = UIColor.clear
        let iconInset: CGFloat = 2.0
        let cornerRadius: CGFloat = 4.0
        let borderWidth: CGFloat = 1.0
        let borderColor = UIColor.gray
        
        // Test
        let image = UIImage.image(icon: icon, color: iconColor, backgroundColor: iconBackgroundColor, size: iconSize, inset: iconInset, cornerRadius: cornerRadius, borderWidth: borderWidth, borderColor: borderColor)
        
        // Verify
        XCTAssertNotNil(image)
        XCTAssertEqual(image!.size, iconSize)
    }
    
    func test_UIImage_bad_notFoundIconImage() {
        // Setup
        let iconSize = CGSize(width: 4, height: 6)
        let icon = TestIcon.notFound
        let iconColor = UIColor.red
        let iconBackgroundColor = UIColor.clear
        let iconInset: CGFloat = 2.0
        let cornerRadius: CGFloat = 4.0
        let borderWidth: CGFloat = 1.0
        let borderColor = UIColor.gray
        
        // Test
        let image = UIImage.image(icon: icon, color: iconColor, backgroundColor: iconBackgroundColor, size: iconSize, inset: iconInset, cornerRadius: cornerRadius, borderWidth: borderWidth, borderColor: borderColor)
        
        // Verify
        XCTAssertNil(image)
    }
    
    func test_UIImage_bad_zeroSizeIcon() {
        // Setup
        let iconSize = CGSize.zero
        let icon = TestIcon.fire
        let iconColor = UIColor.red
        let iconBackgroundColor = UIColor.clear
        let iconInset: CGFloat = 2.0
        let cornerRadius: CGFloat = 4.0
        let borderWidth: CGFloat = 1.0
        let borderColor = UIColor.gray
        
        // Test
        let image = UIImage.image(icon: icon, color: iconColor, backgroundColor: iconBackgroundColor, size: iconSize, inset: iconInset, cornerRadius: cornerRadius, borderWidth: borderWidth, borderColor: borderColor)
        
        // Verify
        XCTAssertNil(image)
    }
    
    func test_UIImage_good_cutoutImageForIcon() {
        // Setup
        let iconSize = CGSize(width: 4, height: 6)
        let icon = TestIcon.fire
        let iconBackgroundColor = UIColor.clear
        let iconInset: CGFloat = 2.0
        let cornerRadius: CGFloat = 4.0
        
        // Test
        let image = UIImage.cutoutImage(icon: icon, backgroundColor: iconBackgroundColor, size: iconSize, inset: iconInset, cornerRadius: cornerRadius)
        
        // Verify
        XCTAssertNotNil(image)
        XCTAssertEqual(image!.size, iconSize)
    }
    
}
