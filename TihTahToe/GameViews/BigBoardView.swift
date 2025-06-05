//
//  BigBoardView.swift
//  TihTahToe
//
//  Created by Owen F on 5/30/25.
//
import SwiftUI

@MainActor
struct BigBoardView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var gsm: GameStateManager
    @State private var selectedCell: (row: Int, col: Int)? = nil

    var body: some View {
        ZStack {
            if(!gsm.gameWon.isEmpty){
                Text("\(gsm.gameWon) has won the game")
                    .font(.system(size: 50))
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 10)
                    .frame(width: 380, height: 380)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                    .zIndex(1)
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 380, height: 380)
                    .foregroundStyle(.gray)
                    .zIndex(1)
            }
            VStack{
                VStack(spacing: 3) {
                    
                    ForEach(0..<3) { i in
                        HStack(spacing: 3) {
                            ForEach(0..<3) { j in
                                Button {
                                    
                                    withAnimation(.easeOut) {
                                        selectedCell = (i, j)
                                    }
                                } label: {
                                    ZStack{
                                        SmallBoardView(bigBoardRow: i, bigBoardCol: j)
                                            .padding(1)
                                            .shadow(color: gsm.largeBoard[i][j].isActive ? .black :.white, radius: 2)
                                        if(gsm.largeBoard[i][j].winner == "x"){
                                            Image(systemName: "xmark.square")
                                                .resizable()
                                                .frame(width: 90, height: 90)
                                                .foregroundStyle(.red)
                                        } else if(gsm.largeBoard[i][j].winner == "o"){
                                            Image(systemName: "circle.square")
                                                .resizable()
                                                .frame(width: 90, height: 90)
                                                .foregroundStyle(.blue)
                                        }
                                    }
                                }
                                .disabled(gsm.largeBoard[i][j].isWon || !gsm.largeBoard[i][j].isActive)
                            }
                        }
                    }
                }
            }

            if let cell = selectedCell {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            selectedCell = nil
                        }
                    }

                // this the popup view
                CustomPopupView(bigBoardRow: cell.row, bigBoardCol: cell.col) {
                    withAnimation {
                        selectedCell = nil
                    }
                }
                .transition(.scale)
                .zIndex(1)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 360, height: 360)
                .foregroundStyle(colorScheme == .dark ? .white : .black)
        )
    }
}

#Preview{
    ContentView()
        .environmentObject(GameStateManager())
}
