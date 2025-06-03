import SwiftUI

struct OpeningView: View {
    @State private var showGame = false
    @State private var showHelp = false
    @EnvironmentObject var gsm: GameStateManager

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black.opacity(0.9), .blue.opacity(0.65)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()

            TicTacToeBackgroundGrid()

            VStack(spacing: 40) {
                HStack(spacing: 10) {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.red)

                    Text("TihTahToe")
                        .font(.system(size: 48, weight: .black))
                        .foregroundStyle(.white)
                        .shadow(color: .black.opacity(0.7), radius: 10, x: 0, y: 4)

                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.cyan)
                }

                VStack(spacing: 20) {
                    Button(action: {showGame = true}) {
                        Text("Play")
                            .font(.title2.bold())
                            .padding()
                            .frame(width: 200)
                            .background(.cyan)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(color: .cyan.opacity(0.6), radius: 10, x: 0, y: 5)
                            .scaleEffect(1.0)
                            .animation(.easeInOut, value: "Play")
                        
                    }

                    VStack(spacing: 20) {
                        Button(action: {showHelp = true}) {
                            Text("Help")
                                .font(.title2.bold())
                                .padding()
                                .frame(width: 200)
                                .background(.red)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(color: .red.opacity(0.6), radius: 10, x: 0, y: 5)
                                .scaleEffect(1.0)
                                .animation(.easeInOut, value: "Help")
                        }
                    }
                }
            }
            .padding(.top, 100)
            .transition(.scale)
        }
        .fullScreenCover(isPresented: $showGame) {
            BigBoardView()
                .environmentObject(gsm)
        }
        .sheet(isPresented: $showHelp) {
            Text("No help for you ")        }
    }
}

#Preview {
    OpeningView()
        .environmentObject(GameStateManager())
}
