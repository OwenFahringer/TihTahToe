//
//  BoardVM.swift
//  TihTahToe
//
//  Created by Owen F on 5/28/25.
//

import SwiftUI

class GameStateManager: ObservableObject {
    @Published var largeBoard: [[smallBoard]] = Array(repeating: Array(repeating: smallBoard(), count: 3), count: 3)
    @Published var turn: Bool = false //false is x, true is o
    @Published var gameWon: String = ""
    
    func nextActive(row: Int, col: Int){ //finds the next active big tile
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
        func didLargeWin(row: Int, col: Int, tile: String) -> Bool{ //figures out if the large tile is won returns player who won tile
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
}
