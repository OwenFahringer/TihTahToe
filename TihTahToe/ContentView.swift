//
//  ContentView.swift
//  TihTahToe
//
//  Created by Owen F on 5/28/25.
//

import SwiftUI

struct Popup: View{
    @State private var showBoard = false
    @EnvironmentObject var gsm: GameStateManager

    var body: some View {
        ZStack {
            Color.blue.opacity(0.1).ignoresSafeArea()
            
            VStack {
                Spacer()
                Button("Play Tic-Tac-Toe") {
                    withAnimation(.spring()) {
                        showBoard = true
                    }
                }
                .padding()
            }
            
            if showBoard {
                // Dimmed background
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showBoard = false
                        }
                    }
                
                // The popup board
                SmallBoardGrid()
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 10)
                    .frame(maxWidth: 300)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
    }
}
struct BigBoardView: View {
    @EnvironmentObject var gsm: GameStateManager
    var body: some View {
        VStack(spacing: 3) {
            ForEach(0..<3) { _ in
                HStack(spacing: 3) {
                    ForEach(0..<3) { _ in
                        SmallBoardGrid()
                            .padding(10)
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
    }
}

struct SmallBoardGrid: View {
    @EnvironmentObject var gsm: GameStateManager
    var body: some View {
        Button{
            print("hi")
        } label : {
            VStack{
                ForEach(0..<3) { i in
                    HStack{
                        ForEach(0..<3) { j in
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1.5)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                                .shadow(radius: 5)
                        }
                    }
                }
            }
            .padding([.horizontal], 5)
            .padding([.vertical], 10)
        }
    }
}


#Preview {
    BigBoardView()
}
