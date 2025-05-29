//
//  TihTahToeApp.swift
//  TihTahToe
//
//  Created by Owen F on 5/28/25.
//

import SwiftUI

@main
struct TihTahToeApp: App {
    @StateObject var gsm: GameStateManager = GameStateManager()
    var body: some Scene {
        WindowGroup {
            BigBoardView()
        }
    }
}
