//
//  SquareTreeMapTests.swift
//  KTDTreeMap
//
//  Created by Kyle Donnelly on 3/15/20.
//

import XCTest
@testable import KTDIconFont

class IconFontTests : XCTestCase {
    
    override class func setUp() {
        super.setUp()
        
        // Cocoapods doesn't add the .ttf as a resource in test target.
        // Move it over manually so the tests can find it.
        // https://gist.github.com/eoghain/1dbbe0d47ce31189e14c058df1488d0d
        let iconFontBundle = Bundle(for: Self.self)
        let fontResourceString = iconFontBundle.path(forResource: TestIcon.fontFileName, ofType: "ttf")!
        let fontData = NSData(contentsOfFile: fontResourceString)!
        let dataProvider = CGDataProvider(data: fontData)!
        let fontRef = CGFont(dataProvider)!
        var errorRef: Unmanaged<CFError>? = nil
        
        XCTAssertTrue(CTFontManagerRegisterGraphicsFont(fontRef, &errorRef))
    }
    
    func test_IconFont_good_loadsFont() {
        // Setup
        let fontName = TestIcon.fontFileName
        
        // Test
        let font = TestIcon.font(size: 12)
        
        // Verify
        XCTAssertEqual(font.fontName, fontName)
    }
    
    func test_IconFont_good_IconCodeLength() {
        // Setup
        let icon = TestIcon.rocket
        let expectedLength = 1
        
        // Test
        let result = TestIcon.iconCode(for: icon)
        
        // Verify
        XCTAssertEqual(result?.count, expectedLength)
    }

    func test_IconStore_good_findsIcon() {
        // Setup
        let iconName = "fire"
        let expected = TestIcon.fire
        let iconStore = IconStore<TestIcon>()
        
        // Test
        let icon = iconStore.icon(name: iconName)
        
        // Verify
        XCTAssertEqual(icon, expected)
    }

    func test_IconStore_good_emptyInitialCache() {
        // Setup
        let iconStore = IconStore<TestIcon>()
        
        // Test
        let cacheSize = iconStore.cacheSize
        
        // Verify
        XCTAssertNil(cacheSize)
    }

    func test_IconStore_good_loadIconsCount() {
        // Setup
        let iconStore = IconStore<TestIcon>()
        let numIcons = Int(TestIcon.count.rawValue) + 1
        
        // Test
        let icons = iconStore.loadIcons()
        
        // Verify
        XCTAssertEqual(icons.count, numIcons)
    }

    func test_IconFont_good_defaultStoreNotReleased() {
        // Setup
        weak var iconStore: IconStore<TestIcon>?
        XCTAssertNil(iconStore)

        // Test
        autoreleasepool {
            iconStore = TestIcon.store
            XCTAssertNotNil(iconStore)
        }

        // Verify
        XCTAssertNotNil(iconStore)
    }

    func test_IconFont_good_defaultStoreIsStatic() {
        // Setup
        let iconStore1 = TestIcon.store
        let pointer1 = Unmanaged.passUnretained(iconStore1).toOpaque()

        // Test
        let iconStore2 = TestIcon.store
        
        // Verify
        let pointer2 = Unmanaged.passUnretained(iconStore2).toOpaque()
        XCTAssertEqual(pointer1, pointer2)
    }

}
