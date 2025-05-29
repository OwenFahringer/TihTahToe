//
//  smallBoard.swift
//  TihTahToe
//
//  Created by Owen F on 5/29/25.
//

import SwiftUI

class smallBoard: ObservableObject {
    @Published var board: [[String]] = Array(repeating: Array(repeating: "", count: 3), count: 3)
    @Published var isActive: Bool = true
    @Published var isWon: Bool = false
    @Published var winner: String = ""
    
    func addFilledTile(row: Int, col: Int, tile: String) { //set tile on board to correct
        //if we want vfx this should be done inside of the view
        if(board[row][col] == ""){
            board[row][col] = tile
        }
    }
    func didWin(row: Int, col: Int, tile: String) -> String{ //figures out if the large tile is won returns player who won tile
        if(
        (board[row][0] == tile && board[row][1] == tile && board[row][2] == tile) || //row
        (board[0][col] == tile && board[1][col] == tile && board[2][col] == tile) || //column
        (board[0][0] == tile && board[1][1] == tile && board[2][2] == tile) || //top left bottom right diagonal
        (board[2][0] == tile && board[1][1] == tile && board[0][2] == tile) //bottom left top right diagonal
        ){
            isActive = false; isWon = true
            return tile
        }
        else{
            return ""
        }
    }
}


/*
check all surrounding tiles
 
 
 */
