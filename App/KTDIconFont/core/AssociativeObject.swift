//
//  AssociativeObject.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/21/20.
//
// Swift runtime associated objects
// https://medium.com/@ttikitu/swift-extensions-can-add-stored-properties-92db66bce6cd
//

import Foundation

public protocol AssociativeObject {
    
    func getValue<T: AnyObject>(key: UnsafePointer<UInt8>) -> T?
    func getValue<T: AnyObject>(key: UnsafePointer<UInt8>, defaultValue: () -> T) -> T
    
    func setValue<T: AnyObject>(_ value: T?, key: UnsafePointer<UInt8>)
    
}

public extension AssociativeObject {
    
    func getValue<T: AnyObject>(key: UnsafePointer<UInt8>) -> T? {
        return objc_getAssociatedObject(self, key) as? T
    }
    
    func getValue<T: AnyObject>(key: UnsafePointer<UInt8>, defaultValue: () -> T) -> T {
        if let value: T = getValue(key: key) {
            return value
        }

        let value = defaultValue()
        setValue(value, key: key)
        return value
    }
    
    func setValue<T: AnyObject>(_ value: T?, key: UnsafePointer<UInt8>) {
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN)
    }
    
}
