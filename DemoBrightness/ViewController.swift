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
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.willResignActiveNotification, object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        usersBrightness = UIScreen.main.brightness
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground(_:)), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidBecomeActive(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillResignActive(_:)), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usersBrightness = UIScreen.main.brightness
        UIScreen.setMainBrightness(brightness:1.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewWillDisappearWasCalled = true
        UIScreen.setMainBrightness(brightness: usersBrightness)
    }
    
    @objc private func applicationWillResignActive(_ notification: NSNotification) {
        UIScreen.setMainBrightness(brightness:1.0)
    }

    @objc private func applicationWillEnterForeground(_ notification: NSNotification) {
        willEnterForegroundWasCalled = true
        usersBrightness = UIScreen.main.brightness
        UIScreen.setMainBrightness(brightness:1.0)
    }

    @objc private func applicationDidBecomeActive(_ notification: NSNotification) {
        usersBrightness = UIScreen.main.brightness
        UIScreen.setMainBrightness(brightness:1.0)
    }

}

