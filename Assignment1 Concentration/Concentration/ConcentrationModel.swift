//
//  ConcentrationModel.swift
//  Concentration
//
//  Created by Jiahong He on 8/16/18.
//  Copyright © 2018 Doodle. All rights reserved.
//

import Foundation

class Concentration {
    init(numberOfPairsOfCards numOfPairs: Int) {
        assert(numOfPairs > 0, "at least 1 pair of cards should be initialized")
        for _ in 0..<numOfPairs {
            let card = Card()
            cards += [card, card] //cards.append(card)
        }
        for i in 0..<numOfPairs * 2 {
            let ind = Int(arc4random_uniform(UInt32(12)))
            let tmp = cards[ind]
            cards[ind] = cards[i]
            cards[i] = tmp
        }
        score = 0
        flipCount = 0
    }
    
    private(set) var cards = Array<Card>() // cards = [cards]()
    private(set) var score: Int
    private(set) var flipCount: Int
    var indexFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for i in cards.indices {
                if cards[i].isfaceUp {
                    if foundIndex == nil {
                        foundIndex = i
                    }
                    else {
                        foundIndex = nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isfaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard (at index: Int) {
        assert(cards.indices.contains(index), "Chosen index not in the cards")
        if cards[index].isMatched {
            return
        }
        if let matchIndex = indexFaceUpCard, matchIndex != index {
            if cards[index].cardIdentifier == cards[matchIndex].cardIdentifier {
                cards[index].isMatched = true
                cards[matchIndex].isMatched = true
                score += 5
            }
            cards[index].isfaceUp = true
        }
        else {
            indexFaceUpCard = index
            score -= 1
        }
        flipCount += 1
    }
    
    func logInfo() {
        for i in 0..<12 {
            print("\(i), \(cards[i].cardIdentifier),\(cards[i].isfaceUp), \(cards[i].isMatched)")
        }
    }
    
    func checkIfGameFinishes() -> Bool {
        for i in 0..<12 {
            if cards[i].isMatched == false {
                return false
            }
        }
        return true
    }
}

