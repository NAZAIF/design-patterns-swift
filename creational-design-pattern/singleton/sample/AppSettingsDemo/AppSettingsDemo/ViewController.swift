//
//  ViewController.swift
//  AppSettingsDemo
//
//  Created by jerin on 28/04/20.
//  Copyright © 2020 jerin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let count = 100
        for index in 0..<count {
            AppSettings.shared.set(value: index, forKey: String(index))
        }
        
//        To simulate the multithread envt
        DispatchQueue.concurrentPerform(iterations: count) { (index) in
            if let n = AppSettings.shared.object(forKey: String(index)) as? Int {
                print(n)    // prints random numbers 
            }
        }
        AppSettings.shared.reset()
        
        DispatchQueue.concurrentPerform(iterations: count) { (index) in
            AppSettings.shared.set(value: index, forKey: String(index))
        }
    }


}

