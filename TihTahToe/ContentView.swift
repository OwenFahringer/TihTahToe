//
//  ContentView.swift
//  TihTahToe
//
//  Created by Owen F on 5/28/25.
//

import SwiftUI

struct ContentView: View{
    var body: some View{
        BigBoardView()
    }
}

#Preview{
    ContentView()
        .environmentObject(GameStateManager())
}
