//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

enum Square {
    case x
    case o
    case empty
    
}

var turnCount = 0

class TicTacToeBrain {
    var playerTurn = Turn.playerOne
    
    
    enum Turn: CaseIterable{
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
    
    func updateBrain(row: Int, col: Int) {
        let square: Square
        switch playerTurn {
        case .playerOne: square = .x
        case .playerTwo: square = .o
        }
        gameboard[row][col] = square
        playerTurn.toggle()
    }
    
    func checkForWin() -> GameStatus {
        var diagonal1 = [Square]()
        for i in 0..<gameboard.count {
            diagonal1.append(gameboard[i][i])
            
        }
        if diagonal1 == [.x,.x,.x]{
            return .playerOneVictory
        } else if diagonal1 == [.o,.o,.o] {
            return .playerTwoVictory
        }
        
        var diagonal2 = [Square]()
        for i in 0..<gameboard.count {
            diagonal2.append(gameboard[i][gameboard.count - 1 - i])
        }
        if diagonal2 == [.x,.x,.x]{
            return .playerOneVictory
        } else if diagonal2 == [.o,.o,.o] {
            return .playerTwoVictory
        }
        
        for rowIndex in gameboard{
            if rowIndex == [.x,.x,.x]{
                return .playerOneVictory
            } else if rowIndex == [.o,.o,.o] {
                return .playerTwoVictory
            }
        }
        
        for colIndex in 0..<gameboard[0].count {
            var col = [Square]()
            for rowIndex in 0..<gameboard.count {
                col.append(gameboard[rowIndex][colIndex])
                if col == [.x,.x,.x] {
                    return .playerOneVictory
                } else if col == [.o,.o,.o] {
                    return .playerTwoVictory
                }
            }
        }
            turnCount += 1
            return .tie
    }
        
        enum GameStatus {
            case playerOneVictory, playerTwoVictory, tie, onGoing
        }
        
        var gameboard = ([[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3))
        
}
