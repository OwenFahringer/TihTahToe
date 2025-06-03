//
//  TicTacToeBackgroundGrid.swift
//  TihTahToe
//
//  Created by Gideon Dayo on 6/2/25.
//


import SwiftUI

struct TicTacToeBackgroundGrid: View {
    var body: some View {
        VStack(spacing: 20) {
        ForEach(0..<3) { _ in
            HStack(spacing: 20) {
                ForEach(0..<3) { _ in
            ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white.opacity(0.05), lineWidth: 2)
                        .frame(width: 80, height: 80)
                            

//holy cooked
            if Bool.random() {
                        Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(.red.opacity(0.1))
                } else {
                            Image(systemName: "circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(.blue.opacity(0.1))
                            }
                        }
                    }
                }
            }
        }
    
        .opacity(0.5)
        .blur(radius: 0.5)
        .scaleEffect(1.4)
        .offset(y: -50)
    }
}
