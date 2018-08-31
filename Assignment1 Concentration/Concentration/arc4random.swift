//
//  arc4random.swift
//  Concentration
//
//  Created by Jiahong He on 8/30/18.
//  Copyright © 2018 Doodle. All rights reserved.
//

import Foundation

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(-self)))
        }
        else {
            return 0
        }
    }
}
