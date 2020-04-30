//
//  AppSettings.swift
//  AppSettingsDemo
//
//  Created by jerin on 28/04/20.
//  Copyright © 2020 jerin. All rights reserved.
//

import Foundation

final public class AppSettings {
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: DispatchQueue.Attributes.concurrent)
    
    private var settings: [String: Any] = [:]
    
    private init() {}
    
    public static let shared = AppSettings()
    
    public func set(value: Any, forKey key: String) {
        concurrentQueue.async(flags: .barrier) {
            // Barrier turns concurrent queue to serial one temporarily. So, no other thread can modify internal settings dictionary while this block is executing
            self.settings[key] = value
        }
    }
    
    public func object(forKey key: String) -> Any? {
        var result: Any?
//        When barrier is not active, the concurrent queue can allow executing read operations in parellel 
        concurrentQueue.sync {
            result = settings[key]
        }
        return result
    }
    
    public func reset() {
        settings.removeAll()
    }
}
