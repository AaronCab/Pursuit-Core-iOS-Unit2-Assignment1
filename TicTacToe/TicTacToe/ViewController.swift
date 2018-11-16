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
    var boardBrain: TicTacToeBrain = TicTacToeBrain()
    
  override func viewDidLoad() {
    super.viewDidLoad()
  }

    @IBOutlet weak var gameResult: UILabel!
    
    @IBAction func buttonPressed(_ sender: GameButton) {
    
        let turn = boardBrain.userTurn
        
        sender.setImage(turn.image(), for: .normal)
        
        boardBrain.updateBrain(row: sender.row, col: sender.col)
        print(boardBrain.checkForWin())
        let result = boardBrain.checkForWin()
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
             gameResult.text = "Its a Tie!"
            }
        case .onGoing:
            print("default")
        }
        
    }
    
    
    @IBAction func newGame(_ sender: UIButton) {
        
        boardBrain.gameDisplay = ([[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3))
        turnCount = 0
        gameResult.text = "Click Anywhere To Start"
        _ = boardBrain.userTurn
       
        //sender.setImage(turn.image(), for: .normal)
        boardBrain.userTurn = .userOne
        allTheButtons.forEach{$0.isEnabled = true}
        allTheButtons.forEach{ (button) in
            button.setImage(UIImage(), for: .normal)
        }
    }
}


