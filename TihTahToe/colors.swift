//
//  colors.swift
//  TihTahToe
//
//  Created by Owen F on 6/5/25.
//

import SwiftUI

extension Color {
    static let custYellow: Color = .init(red: 242/255, green: 242/255, blue: 40/255)
}

#Preview{
    ContentView()
        .environmentObject(GameStateManager())
}
