//
//  AssociativeObject+IconFont.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/21/20.
//

import Foundation

extension AssociativeObject {
    
    func getIcon<T: IconFont>(key: UnsafePointer<UInt8>) -> T? {
        guard let backingValue: T.BackingObject = getValue(key: key) else {
            return nil
        }
        
        return T.initWithBackingObject(backingValue)
    }
    
    func getIcon<T: IconFont>(key: UnsafePointer<UInt8>, defaultValue: () -> T.BackingObject) -> T {
        let backingValue: T.BackingObject = getValue(key: key, defaultValue: defaultValue)
        return T.initWithBackingObject(backingValue)
    }
    
    func setIcon<T: IconFont>(_ value: T?, key: UnsafePointer<UInt8>) {
        let backingValue = value?.backingObject
        setValue(backingValue, key: key)
    }
    
}

public extension IconFont where Self.RawValue == unichar {
    
    var backingObject: NSNumber {
        NSNumber(value: self.rawValue)
    }
    
    static func initWithBackingObject(_ backingObject: NSNumber) -> Self {
        guard let iconFont = Self(rawValue: backingObject.uint16Value) else {
            preconditionFailure("Tried to create IconFont with unknown raw value.")
        }
        
        return iconFont
    }
    
}
