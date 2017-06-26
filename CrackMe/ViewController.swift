//
//  ViewController.swift
//  CrackMe
//
//  Created by Felix Wehnert on 26.06.17.
//  Copyright © 2017 Felix Wehnert. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate {

    @IBOutlet weak var label: NSTextField!
    @IBOutlet weak var textField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func controlTextDidChange(_ obj: Notification) {
        
        label.stringValue = ""
        
        if let manager = LicensingManager(license: textField.stringValue) {
            
            if manager.featureSet.contains(LicensingFeatures.Feature1) {
                label.stringValue += "Feature 1 enabled\n"
            }
            if manager.featureSet.contains(LicensingFeatures.Feature2) {
                label.stringValue += "Feature 2 enabled\n"
            }
            if manager.featureSet.contains(LicensingFeatures.Feature3) {
                label.stringValue += "Feature 3 enabled\n"
            }
            if manager.featureSet.contains(LicensingFeatures.Feature4) {
                label.stringValue += "Feature 4 enabled\n"
            }
            if manager.isBeta() {
                label.stringValue += "BETA!"
            } else if manager.isAlpha() {
                label.stringValue += "ALPHA!"
            }
            
        } else {
            label.stringValue = "Invalid license"
        }
        
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

