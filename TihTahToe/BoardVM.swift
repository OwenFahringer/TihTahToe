//
//  BoardVM.swift
//  TihTahToe
//
//  Created by Owen F on 5/28/25.
//

import SwiftUI

class BoardVM: ObservableObject {
    @State private var board: [[String]] = Array(repeating: Array(repeating: "", count: 3), count: 3)
    @State private var turn: Bool = false
    
    
}
