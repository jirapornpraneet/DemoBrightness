//
//  ViewController.swift
//  DemoBrightness
//
//  Created by Donut on 23/9/2564 BE.
//

import UIKit

class ViewController: UIViewController {
    
    private var usersBrightness = UIScreen.main.brightness
    private var willEnterForegroundWasCalled = false
    private var viewWillDisappearWasCalled = false

    override func viewDidLoad() {
        super.viewDidLoad()
        usersBrightness = UIScreen.main.brightness
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usersBrightness = UIScreen.main.brightness
        UIScreen.setMainBrightness(brightness:1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewWillDisappearWasCalled = true
        UIScreen.setMainBrightness(brightness: usersBrightness)
    }
    
    @objc private func applicationWillResignActive() {
        UIScreen.setMainBrightness(brightness: usersBrightness)
    }

    @objc private func applicationWillEnterForeground() {
        willEnterForegroundWasCalled = true
        usersBrightness = UIScreen.main.brightness
        UIScreen.setMainBrightness(brightness:1)
    }

    @objc private func applicationDidBecomeActive() {
        usersBrightness = UIScreen.main.brightness
        UIScreen.setMainBrightness(brightness:1)
    }

}

