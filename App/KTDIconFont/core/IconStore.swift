//
//  IconStore.swift
//  KTDIconFont
//
//  Created by Kyle Donnelly on 3/20/20.
//

import Foundation

// Provides access to a shared IconStore for each IconFont type.
internal class IconStoreFactory {
    
    private static var stores: [String: Any] = [:]
    
    static func store<T: IconFont>(type: T.Type) -> IconStore<T> {
        let storeKey = "\(type)"
        if let cached = stores[storeKey] as? IconStore<T> {
            return cached
        } else {
            let newStore = IconStore<T>()
            stores[storeKey] = newStore
            return newStore
        }
    }
    
}

// Associates strings with case values for a given IconFont enum.
public class IconStore<T: IconFont> {
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(clearCache), name: UIApplication.didReceiveMemoryWarningNotification, object: nil)
    }
    
    public func icon(name: String) -> T? {
        return self.iconNames[name]
    }
    
    private var _iconNames: [String: T]?
    private var iconNames: [String: T] {
        get {
            if let cache = _iconNames {
                return cache
            } else {
                let namedCases = loadIcons()
                _iconNames = namedCases
                return namedCases
            }
        }
        set { _iconNames = newValue}
    }
    
    @objc public func clearCache() {
        _iconNames = nil
    }
    
}

/// Testing access
internal extension IconStore {
    
    @inlinable func loadIcons() -> [String: T] {
        // See documentation for CaseIterable
        return T.allCases.reduce(into: [String: T]()) {
            $0["\($1)"] = $1
        }
    }
    
    var cacheSize: Int? {
        return _iconNames?.count
    }
    
}
