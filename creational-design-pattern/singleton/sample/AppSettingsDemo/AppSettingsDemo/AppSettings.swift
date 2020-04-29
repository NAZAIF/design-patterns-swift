//
//  AppSettings.swift
//  AppSettingsDemo
//
//  Created by jerin on 28/04/20.
//  Copyright © 2020 jerin. All rights reserved.
//

import Foundation

final public class AppSettings {
    private let serialQueue = DispatchQueue(label: "serialQueue ")
    
    private var settings: [String: Any] = [:]
    
    private init() {}
    
    public static let shared = AppSettings()
    
    public func set(value: Any, forKey key: String) {
        serialQueue.sync {
            settings[key] = value
        }
    }
    
    public func object(forKey key: String) -> Any? {
        var result: Any?
        serialQueue.sync {
            result = settings[key]
        }
        return result
    }
    
    public func reset() {
        settings.removeAll()
    }
}
