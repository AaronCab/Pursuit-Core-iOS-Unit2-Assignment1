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
    var userTurn = Turn.userOne
    
    
    enum Turn: CaseIterable{
        case userOne
        case userTwo
        
        func image() -> UIImage {
            var buttonImage: UIImage!
            switch self{
            case .userOne:
                buttonImage = UIImage(named: "x-image")
            case .userTwo:
                buttonImage = UIImage(named: "o-image")
                
            }
            return buttonImage
        }
        mutating func toggle() {
            switch self {
            case .userOne: self = .userTwo
            case .userTwo: self = .userOne
            }
        }
    }
    
    func updateBrain(row: Int, col: Int) {
        let square: Square
        switch userTurn {
        case .userOne: square = .x
        case .userTwo: square = .o
        }
        gameDisplay[row][col] = square
        userTurn.toggle()
    }
    
    func checkForWin() -> GameEnd {
        var diagonal1 = [Square]()
        for i in 0..<gameDisplay.count {
            diagonal1.append(gameDisplay[i][i])
            
        }
        if diagonal1 == [.x,.x,.x]{
            return .playerOneVictory
        } else if diagonal1 == [.o,.o,.o] {
            return .playerTwoVictory
        }
        
        var diagonal2 = [Square]()
        for i in 0..<gameDisplay.count {
            diagonal2.append(gameDisplay[i][gameDisplay.count - 1 - i])
        }
        if diagonal2 == [.x,.x,.x]{
            return .playerOneVictory
        } else if diagonal2 == [.o,.o,.o] {
            return .playerTwoVictory
        }
        
        for rowIndex in gameDisplay{
            if rowIndex == [.x,.x,.x]{
                return .playerOneVictory
            } else if rowIndex == [.o,.o,.o] {
                return .playerTwoVictory
            }
        }
        
        for colIndex in 0..<gameDisplay[0].count {
            var col = [Square]()
            for rowIndex in 0..<gameDisplay.count {
                col.append(gameDisplay[rowIndex][colIndex])
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
        
        enum GameEnd {
            case playerOneVictory, playerTwoVictory, tie, onGoing
        }
        
        var gameDisplay = ([[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3))
        
}
