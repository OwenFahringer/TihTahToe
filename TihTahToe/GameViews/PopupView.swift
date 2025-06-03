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
    @State var onClose: () -> Void
    @EnvironmentObject var gsm: GameStateManager

    var body: some View {
        VStack(spacing: 20) {
            Text("Cell (\(bigBoardRow), \(bigBoardCol))")
                .font(.headline)

            SmallBoardPopupView(bigBoardRow: bigBoardRow, bigBoardCol: bigBoardCol, onClose: $onClose)

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

struct SmallBoardPopupView: View { //This is different from SmallBoardView
    @EnvironmentObject var gsm: GameStateManager
    let bigBoardRow: Int
    let bigBoardCol: Int
    @Binding var onClose: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 110, height:110)
                .foregroundStyle(.white)
            VStack {
                ForEach(0..<3, id: \.self) { i in
                HStack(spacing: 4) {
                    ForEach(0..<3, id: \.self) { j in
                        CellButton(i: i, j: j, bigBoardRow: bigBoardRow, bigBoardCol: bigBoardCol, onClose: $onClose)
                    }
                }
            }

            }
        }
        .padding(5)
    }
}
struct CellButton: View { //makes button because swift flips out with too much code in one View
    @EnvironmentObject var gsm: GameStateManager
    let i: Int
    let j: Int
    let bigBoardRow: Int
    let bigBoardCol: Int
    @Binding var onClose: () -> Void
    
    var body: some View {
        let symbol = gsm.largeBoard[bigBoardRow][bigBoardCol].board[i][j]
        let isDisabled = gsm.largeBoard[bigBoardRow][bigBoardCol].board[i][j] != ""

        return Button {
            gsm.largeBoard[bigBoardRow][bigBoardCol].addFilledTile(row: i, col: j, tile: gsm.turn)
            gsm.largeBoard[bigBoardRow][bigBoardCol].didWin(row: i, col: j, tile: gsm.turn)
            gsm.didLargeWin(row: bigBoardRow, col: bigBoardCol, tile: gsm.turn)
            gsm.nextActive(row: i, col: j)
            gsm.doNextTurn()
            onClose()
        } label: {
            ZStack {
                if symbol == "x" {
                    Image(systemName: "xmark.square")
                        .foregroundStyle(.red)
                        .frame(width:30, height: 30)
                } else if symbol == "o" {
                    Image(systemName: "circle.square")
                        .foregroundStyle(.blue)
                        .frame(width:30, height: 30)
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

#Preview{
    ContentView().environmentObject(GameStateManager())
}
