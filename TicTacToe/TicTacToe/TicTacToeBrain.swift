//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class TicTacToeBrain {
    var playerTurn = Turn.playerOne
//    let winningCombos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8], [0,4,8], [2,4,6]]
    
    enum Turn: String, CaseIterable{
        case playerOne
        case playerTwo

        func image() -> UIImage {
            var buttonImage: UIImage!
            switch self{
            case .playerOne:
                buttonImage = UIImage(named: "x-image")
            case .playerTwo:
                buttonImage = UIImage(named: "o-image")

            }
            return buttonImage
        }
        mutating func toggle() {
            switch self {
            case .playerOne: self = .playerTwo
            case .playerTwo: self = .playerOne
            }
        }
    }
    
    func updateBrain(row: Int, col: Int){
        let square: Square
        switch playerTurn {
        case .playerOne: square = .x
        case .playerTwo: square = .o
        }
        gameboard[row][col] = square
        playerTurn.toggle()
    }
    
//    func checkForWin() -> playerTurn? {
//        for combo in winningCombos {
//            let row = combo.map {_ in gameboard[0]}
//            if (row[0]) != nil && row[0] == row[1] && row[1] == row[2] {
//                return row[0]
//            }
//        }
//        return nil
//    }
    
    enum Square {
        case x
        case o
        case empty
        
    }
    
    var gameboard = ([[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3))
    
    
    
}
