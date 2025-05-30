//
//  PopupView.swift
//  TihTahToe
//
//  Created by Owen F on 5/30/25.
//

import SwiftUI

struct CustomPopupView: View {
    let bigBoardRow: Int
    let bigBoardCol: Int
    let onClose: () -> Void
    @EnvironmentObject var gsm: GameStateManager

    var body: some View {
        VStack(spacing: 20) {
            Text("Cell (\(bigBoardRow), \(bigBoardCol))")
                .font(.headline)

            SmallBoardPopupView(bigBoardRow: bigBoardRow, bigBoardCol: bigBoardCol)

            Button("Close") {
                onClose()
            }
            .padding(.top)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .frame(maxWidth: 300)
    }
}

struct SmallBoardPopupView: View {
    @EnvironmentObject var gsm: GameStateManager
    let bigBoardRow: Int
    let bigBoardCol: Int

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 110, height:110)
                .foregroundStyle(.white)
            VStack {
                ForEach(0..<3) { i in
                    HStack {
                        ForEach(0..<3) { j in
                            Button{
                                
                            } label: {
                                ZStack {
                                    if gsm.largeBoard[bigBoardRow][bigBoardCol].board[i][j] == "x" {
                                        Image("x.square")
                                    } else if gsm.largeBoard[bigBoardRow][bigBoardCol].board[i][j] == "o" {
                                        Image("o.square")
                                    }
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(lineWidth: 1.5)
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.black)
                                        .shadow(color: .white, radius: 2)
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(5)
    }
}
