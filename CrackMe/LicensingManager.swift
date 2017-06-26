//
//  File.swift
//  CrackMe
//
//  Created by Felix Wehnert on 26.06.17.
//  Copyright © 2017 Felix Wehnert. All rights reserved.
//

import Foundation

class LicensingManager {
    
    private var license: String
    
    var beta: Bool = false
    var alpha: Bool = false
    
    var featureSet: LicensingFeatures
    
    init?(license: String) {
        
        self.license = license
        
        if self.license.hasPrefix("BT") {
            beta = true
        } else if self.license.hasPrefix("AL") {
            alpha = true
        } else if !self.license.hasPrefix("FW") {
            return nil
        }
        
        
        let index = self.license.index(self.license.startIndex, offsetBy: 2)
        
        let featureString = self.license[index...]
        let featureInt: [Int] = featureString.filter({$0.unicodeScalars.first?.isASCII ?? false}).map({$0.unicodeScalars.first!.value}).map({Int($0)})
        let features = featureInt.reduce(0, { (r, i) -> Int in
            return r + i
        })
        
        self.featureSet = LicensingFeatures(rawValue: features)
        
    }
    
    
    func isBeta() -> Bool {
        return beta
    }
    
    func isAlpha() -> Bool {
        return alpha
    }
    
    
    
}
