//
//  LicensingFeatures.swift
//  CrackMe
//
//  Created by Felix Wehnert on 26.06.17.
//  Copyright © 2017 Felix Wehnert. All rights reserved.
//

import Foundation

struct LicensingFeatures: OptionSet {
    
    static var Feature1: LicensingFeatures = LicensingFeatures(rawValue: 1 << 0)
    static var Feature2: LicensingFeatures = LicensingFeatures(rawValue: 1 << 1)
    static var Feature3: LicensingFeatures = LicensingFeatures(rawValue: 1 << 2)
    static var Feature4: LicensingFeatures = LicensingFeatures(rawValue: 1 << 3)
    
    init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    mutating func formUnion(_ other: LicensingFeatures) {
        self.rawValue = self.rawValue | other.rawValue
    }
    
    mutating func formIntersection(_ other: LicensingFeatures) {
        self.rawValue = self.rawValue & other.rawValue
    }
    
    mutating func formSymmetricDifference(_ other: LicensingFeatures) {
        self.rawValue = (self.rawValue | other.rawValue) ^ other.rawValue
    }
    
    typealias RawValue = Int
    var rawValue: Int
    
    static func ==(lhs: LicensingFeatures, rhs: LicensingFeatures) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
    
    
    
    
}
