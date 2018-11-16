//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var allTheButtons: [GameButton]!
    var gameBrain: TicTacToeBrain = TicTacToeBrain()
    
  override func viewDidLoad() {
    super.viewDidLoad()
  }

    @IBOutlet weak var gameResult: UILabel!
    
    @IBAction func buttonPressed(_ sender: GameButton) {
    
        let turn = gameBrain.playerTurn
        
        sender.setImage(turn.image(), for: .normal)
        
        gameBrain.updateBrain(row: sender.row, col: sender.col)
        print(gameBrain.checkForWin())
        let result = gameBrain.checkForWin()
        switch result{
        case .playerOneVictory:
            gameResult.text = "Player One Victory"
            allTheButtons.forEach{(button) in
                button.isEnabled = false
            }
        case .playerTwoVictory:
            gameResult.text = "Player Two Victory"
            allTheButtons.forEach{(button) in
                button.isEnabled = false
            }
        case .tie:
            print(turnCount)
            if turnCount == 18 {
             gameResult.text = "Its a tie"
            }
        case .onGoing:
            print("default")
        }
        sender.isEnabled = false
        
    }
    
    
    @IBAction func newGame(_ sender: UIButton) {
        
        gameBrain.gameboard = ([[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3))
        turnCount = 0
        gameResult.text = "Click Anywhere To Start"
        _ = gameBrain.playerTurn
       
        //sender.setImage(turn.image(), for: .normal)
        gameBrain.playerTurn = .playerOne
        allTheButtons.forEach{$0.isEnabled = true}
        allTheButtons.forEach{ (button) in
            button.setImage(UIImage(), for: .normal)
        }
    }
}


