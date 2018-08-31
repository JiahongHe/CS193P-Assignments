//
//  Card.swift
//  Concentration
//
//  Created by Jiahong He on 8/16/18.
//  Copyright © 2018 Doodle. All rights reserved.
//

import Foundation

struct Card {
    var isfaceUp = false
    var isMatched = false
    var cardIdentifier: Int
    
    private static var identifierFactory = 0
    private static func getUniqueIdentifier () -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.cardIdentifier = Card.getUniqueIdentifier()
    }
}
