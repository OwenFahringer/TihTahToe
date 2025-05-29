//
//  BoardVM.swift
//  TihTahToe
//
//  Created by Owen F on 5/28/25.
//

import SwiftUI

class GameStateManager: ObservableObject {
    @Published var boardGrid: [[smallBoard]] = Array(repeating: Array(repeating: smallBoard(), count: 3), count: 3)
    @Published var turn: Bool = false //false is x, true is o
    
    
    func nextActive(row: Int, col: Int){
        for i in boardGrid.indices{
            for j in boardGrid[i].indices{
                boardGrid[i][j].isActive = false
            }
        }
        boardGrid[row][col].isActive = true
    }
}
