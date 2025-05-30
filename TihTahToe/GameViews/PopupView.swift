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
                ForEach(0..<3, id: \.self) { i in
                HStack(spacing: 4) {
                    ForEach(0..<3, id: \.self) { j in
                        CellButton(i: i, j: j, bigBoardRow: bigBoardRow, bigBoardCol: bigBoardCol)
                    }
                }
            }

            }
        }
        .padding(5)
    }
}
struct CellButton: View {
    @EnvironmentObject var gsm: GameStateManager
    let i: Int
    let j: Int
    let bigBoardRow: Int
    let bigBoardCol: Int

    var body: some View {
        let symbol = gsm.largeBoard[bigBoardRow][bigBoardCol].board[i][j]
        let isDisabled = symbol != ""

        return Button {
            gsm.largeBoard[bigBoardRow][bigBoardCol].board[i][j] = gsm.turn
        } label: {
            ZStack {
                if symbol == "x" {
                    Image(systemName: "xmark.square")
                } else if symbol == "o" {
                    Image(systemName: "circle")
                }
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1.5)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
            }
        }
        .disabled(isDisabled)
    }
}
