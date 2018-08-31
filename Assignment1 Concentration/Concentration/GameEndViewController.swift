//
//  GameEndViewController.swift
//  Concentration
//
//  Created by Jiahong He on 8/18/18.
//  Copyright © 2018 Doodle. All rights reserved.
//

import UIKit

class GameEndViewController: UIViewController {

    @IBOutlet weak var flipLabel: UILabel!
    @IBOutlet weak var gameOverTitle: UILabel!
    @IBOutlet weak var ScoreBoard: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    var packet: infoPacket!
    var score = 0
    var flips = 0
    var theme: Theme!
    
    @IBAction func StartNewGame(_ sender: UIButton) {
        performSegue(withIdentifier: "GoBackToGame", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score = packet.score
        theme = packet.theme
        flips = packet.flip
        view.backgroundColor = theme.backgroundColor
        gameOverTitle.textColor = theme.cardColor
        ScoreBoard.textColor = theme.cardColor
        newGameButton.setTitleColor(theme.cardColor, for: .normal)
        flipLabel.textColor = theme.cardColor
        
        ScoreBoard.text = "Your Score: \(score)"
        flipLabel.text = "Flips: \(flips)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
