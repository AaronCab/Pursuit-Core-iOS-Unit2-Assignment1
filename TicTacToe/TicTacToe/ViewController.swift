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
        
        switch gameBrain.checkForWin(){
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
            allTheButtons.forEach{(button) in
                button.isEnabled = false
            }
        case .onGoing:
            print("default")
        }
        
        
    }
    
    
    @IBAction func newGame(_ sender: UIButton) {
        gameBrain.gameboard = ([[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3))
        
        let turn = gameBrain.playerTurn
        
        sender.setImage(turn.image(), for: .normal)
        allTheButtons.forEach{$0.isEnabled = true}
        allTheButtons.forEach{ (button) in
            button.setImage(UIImage(), for: .normal)
        }
    }
}


