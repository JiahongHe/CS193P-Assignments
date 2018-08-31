//
//  themes.swift
//  Concentration
//
//  Created by Jiahong He on 8/30/18.
//  Copyright © 2018 Doodle. All rights reserved.
//

import Foundation
import UIKit

//6 different themes
private var allEmojis = [["🎃", "👻", "🐒", "🙈", "🧠", "👅", "😸", "🌚", "🐓"],
                         ["🤷‍♀️", "🤦‍♂️", "🙆‍♀️", "🙋‍♂️", "💁‍♂️", "💁‍♀️", "💆‍♂️", "🙇‍♂️", "🙅‍♀️"],
                         ["⚽️", "🏈", "⚾️", "🏉", "🎱", "🏓", "🥊", "🏏", "🏹"],
                         ["🚌", "🚘", "🚞", "🏍", "🚡", "🚀", "🚁", "🚢", "🚒"],
                         ["💻", "🖥", "🖨", "📱", "⌚️", "📷", "📺", "🕰", "📟"],
                         ["🥖", "🧀", "🍞", "🥐", "🍠", "🍕", "🍜", "🍙", "🍡"]]

private func getEmojiChoices() -> [String] {
    let index = 6.arc4random
    return allEmojis[index]
}

enum Theme: Int {
    case Halloween, People, Sports, Transports, Electronics, Food
    var cardColor: UIColor {
        switch self {
        case .Halloween:
            return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        case .Electronics:
            return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        case .Food:
            return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case .People:
            return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        case .Sports:
            return #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        case .Transports:
            return #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .Halloween:
            return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        case .Electronics:
            return #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        case .Food:
            return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        case .People:
            return #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        case .Sports:
            return #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        case .Transports:
            return #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }
    }
    
    var emojis: [String] {
        switch self {
            case .Halloween:
            return ["🎃", "👻", "🐒", "🙈", "🧠", "👅", "😸", "🌚", "🐓"]
            case .Electronics:
            return ["💻", "🖥", "🖨", "📱", "⌚️", "📷", "📺", "🕰", "📟"]
            case .Food:
            return ["🥖", "🧀", "🍞", "🥐", "🍠", "🍕", "🍜", "🍙", "🍡"]
            case .People:
            return ["🤷‍♀️", "🤦‍♂️", "🙆‍♀️", "🙋‍♂️", "💁‍♂️", "💁‍♀️", "💆‍♂️", "🙇‍♂️", "🙅‍♀️"]
            case .Sports:
            return ["⚽️", "🏈", "⚾️", "🏉", "🎱", "🏓", "🥊", "🏏", "🏹"]
            case .Transports:
            return ["🚌", "🚘", "🚞", "🏍", "🚡", "🚀", "🚁", "🚢", "🚒"]
        }
    }
    static var themeCount: Int {
        return Theme.Food.rawValue + 1
    }
    static func getRandomEmojis() -> Theme {
        return Theme(rawValue: themeCount.arc4random)!
    }
}


