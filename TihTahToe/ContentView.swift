//
//  ContentView.swift
//  TihTahToe
//
//  Created by Owen F on 5/28/25.
//

import SwiftUI

@MainActor
struct ContentView: View{
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var gsm: GameStateManager
    var body: some View{
        VStack{
            HStack{
                if(gsm.turn == "x"){
                    Image(systemName: "xmark.square")
                        .foregroundStyle(.red)
                        .frame(width:30, height: 30)
                        .padding(0)
                    Text("to move")
                }else if(gsm.turn == "o"){
                    Image(systemName: "circle.square")
                        .foregroundStyle(.blue)
                        .frame(width:30, height: 30)
                        .padding(0)
                    Text("to move")
                }
            }
            BigBoardView()
            Button{ //Add confirmation
                gsm.resetBoard()
            }label: {
                Text("Reset")
                    .frame(width: 100, height: 40)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1.5)
                    )
            }
            .foregroundStyle(colorScheme == .dark ? .white : .black)
            .shadow(color: .gray, radius: 2)
        }
    }
}

#Preview{
    ContentView()
        .environmentObject(GameStateManager())
}
