//
//  BigBoardView.swift
//  TihTahToe
//
//  Created by Owen F on 5/30/25.
//

import SwiftUI

struct BigBoardView: View {
    @EnvironmentObject var gsm: GameStateManager
    @State private var selectedCell: (row: Int, col: Int)? = nil

    var body: some View {
        ZStack {
            VStack(spacing: 3) {
                ForEach(0..<3) { i in
                    HStack(spacing: 3) {
                        ForEach(0..<3) { j in
                            Button {
                                withAnimation(.spring()) {
                                    selectedCell = (i, j)
                                }
                            } label: {
                                SmallBoardView(bigBoardRow: i, bigBoardCol: j)
                                    .padding(1)
                            }
                        }
                    }
                }
            }

            if let cell = selectedCell {
                // Dim background
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            selectedCell = nil
                        }
                    }

                // Custom popup view
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
                .foregroundStyle(.black)
                .frame(width: 360, height: 360)
        )
    }
}

#Preview{
    BigBoardView()
        .environmentObject(GameStateManager())
}
