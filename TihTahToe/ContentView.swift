//
//  ContentView.swift
//  TihTahToe
//
//  Created by Owen F on 5/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 8) {
            ForEach(0..<3) { _ in
                HStack(spacing: 8) {
                    ForEach(0..<3) { _ in
                        SmallBoardGrid()
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
    }
}

struct SmallBoardGrid: View {
    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height)
            let cellSize = size / 3

            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 2)

                ForEach(1..<3) { i in
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: size)
                        .position(x: CGFloat(i) * cellSize, y: size / 2)
                }

                ForEach(1..<3) { i in
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: size, height: 1)
                        .position(x: size / 2, y: CGFloat(i) * cellSize)
                }
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}


#Preview {
    ContentView()
}
