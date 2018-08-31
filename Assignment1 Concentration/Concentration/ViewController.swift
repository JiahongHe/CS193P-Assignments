//
//  ViewController.swift
//  Concentration
//
//  Created by Jiahong He on 8/16/18.
//  Copyright © 2018 Doodle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseRandomTheme()
        flipCountLabel.textColor = selectedTheme.cardColor
    }
    private func chooseRandomTheme() {
        selectedTheme = Theme.getRandomEmojis()
        view.backgroundColor = selectedTheme.backgroundColor
        for button in cardButtons {
            button.backgroundColor = selectedTheme.cardColor
        }
        scoreLabel.textColor = selectedTheme.cardColor
        emojiDic = [:]
        emojiChoices = selectedTheme.emojis
    }
    
    private(set) var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    private var currentScore: Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(currentScore)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    private lazy var game = Concentration(numberOfPairsOfCards: numOfCardPairs)
    private var selectedTheme: Theme!
    private var emojiChoices: [String]!
    private var emojiDic = Dictionary<Int, String>()
    
    
    var numOfCardPairs: Int {
        get {
            return ((cardButtons.count + 1) / 2)
        }
    }
    
    private var finalScore = 0
    private var finalFlip = 0
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToScoreScreen" {
            let destinationVC = segue.destination as? GameEndViewController
            destinationVC?.packet = (sender as? infoPacket)!
        }
    }
    @IBAction func touchCard(_ sender: UIButton) {
        if game.checkIfGameFinishes() {
            self.finalScore = currentScore
            self.finalFlip = flipCount
            gameReset()
            let packet = infoPacket(score_: finalScore, flip_: finalFlip ,theme_: selectedTheme)
            performSegue(withIdentifier: "GoToScoreScreen", sender: packet)
            
        }
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            flipCount = game.flipCount
            currentScore = game.score
        }
        else {
            print("chosen card not in the card collection")
        }
    }
    
    
    private func updateViewFromModel () {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isfaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): selectedTheme.cardColor
            }
        }
        
    }
    //var emojiChoices = ["🥖", "🧀", "🍞", "🥐", "🍠", "🍕", "🍜", "🍙", "🍡"]
    func emoji(for card: Card) -> String {
        if emojiDic[card.cardIdentifier] == nil {
            if emojiChoices.count > 0 {
                let randomIndex = emojiChoices.count.arc4random
                emojiDic[card.cardIdentifier] = emojiChoices.remove(at:randomIndex)
            }
        }
        return emojiDic[card.cardIdentifier] ?? "?"
    }
    func gameReset() {
        //emojiChoices = ["🎃", "👻", "🐒", "🙈", "🧠", "👅", "😸", "🌚", "🐓"]
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        flipCount = 0
    }
    
}

struct infoPacket {
    var score: Int
    var flip: Int
    var theme: Theme
    init(score_: Int, flip_: Int, theme_: Theme) {
        score = score_
        flip = flip_
        theme = theme_
    }
}
