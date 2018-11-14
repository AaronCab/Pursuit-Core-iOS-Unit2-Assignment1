//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gameBrain: TicTacToeBrain = TicTacToeBrain()
    
  override func viewDidLoad() {
    super.viewDidLoad()
  }

    @IBAction func buttonPressed(_ sender: GameButton) {
        let turn = gameBrain.playerTurn
        
        sender.setImage(turn.image(), for: .normal)

        
        gameBrain.updateBrain(row: sender.row, col: sender.col)
        
        
        sender.isUserInteractionEnabled = false
    }
    
}

