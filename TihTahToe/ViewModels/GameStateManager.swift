//
//  BoardVM.swift
//  TihTahToe
//
//  Created by Owen F on 5/28/25.
//

import SwiftUI

@MainActor
class GameStateManager: ObservableObject {
    @Published var largeBoard: [[smallBoard]] = (0..<3).map { _ in
    (0..<3).map { _ in smallBoard() }
}
    @Published var turn: String = "x"
    @Published var gameWon: String = ""
    
    func nextActive(row: Int, col: Int){ //finds the next active big tile, requires row and col from small board
        for i in largeBoard.indices{
            for j in largeBoard[i].indices{
                largeBoard[i][j].isActive = false
            }
        }
        if(largeBoard[row][col].isWon){ //checks if the selected big tile is won
            for i in largeBoard.indices{
                for j in largeBoard[i].indices{
                    if(!largeBoard[i][j].isWon){ //sets all tiles that are won to true
                        largeBoard[i][j].isActive = true
                    }
                }
            }
        }else{
            largeBoard[row][col].isActive = true
        }
    }
        func didLargeWin(row: Int, col: Int, tile: String) -> Bool{ //returns true if game should end winner stored in gameWon
            if (
                (largeBoard[row][0].winner == tile && largeBoard[row][1].winner == tile && largeBoard[row][2].winner == tile) || // row
                (largeBoard[0][col].winner == tile && largeBoard[1][col].winner == tile && largeBoard[2][col].winner == tile) || // column
                (largeBoard[0][0].winner == tile && largeBoard[1][1].winner == tile && largeBoard[2][2].winner == tile) || // top left to bottom right diagonal
                (largeBoard[2][0].winner == tile && largeBoard[1][1].winner == tile && largeBoard[0][2].winner == tile) // bottom left to top right diagonal
            ){
                gameWon = tile
                return true
            }
            else{
                return false
        }
    }
    func doNextTurn(){
        //call funcs before going next turn, implement one at a time to test for readiness
        if(turn == "x"){
            turn = "o"
        } else {
            turn = "x"
        }
//        turn == "x" ? turn = "o" : turn = "x"
    }
}
