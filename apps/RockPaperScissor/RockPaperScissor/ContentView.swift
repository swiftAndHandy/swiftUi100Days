//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Andre Veltens on 29.11.24.
//

import SwiftUI

enum GameSymbol: CaseIterable {
    case rock, paper, scissors
    
    static func random() -> GameSymbol {
        .allCases.randomElement()!
    }
}

struct ContentView: View {
    @State private var winRequired: Bool = Bool.random()
    @State private var appSymbol: GameSymbol = GameSymbol.random()
    @State private var score: Int = 0
    @State private var round: Int = 0
    @State private var gameOver: Bool = false
    
    private var maxRounds: Int = 10
    
    
    func play(with playerSymbol: GameSymbol) {
        
        if winRequired {
            switch playerSymbol {
                case .rock:
                    if appSymbol == .scissors {
                        score += 1
                    } else {
                        score -= 1
                    }
                break
                case .paper:
                    if appSymbol == .rock {
                        score += 1
                    } else {
                        score -= 1
                    }
                break
                case .scissors:
                    if appSymbol == .paper {
                        score += 1
                    } else {
                        score -= 1
                    }
                break
            }
        } else {
            switch playerSymbol {
                case .rock:
                    if appSymbol == .paper {
                        score += 1
                    } else {
                        score -= 1
                    }
                break
                case .paper:
                    if appSymbol == .scissors {
                        score += 1
                    } else {
                        score -= 1
                    }
                break
                case .scissors:
                    if appSymbol == .rock {
                        score += 1
                    } else {
                        score -= 1
                    }
                break
            }
        }
        
        winRequired.toggle()
        appSymbol = GameSymbol.random()
        round += 1
        
        if round >= 10 {
            gameOver = true
        }
    }
    
    func newGame() {
        appSymbol = GameSymbol.random()
        winRequired = Bool.random()
        gameOver = false
        score = 0
        round = 0
    }
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.blue, .red], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack {
                    Text("Your opponent choosed")
                    Text("\(appSymbol)".capitalized)
                        .font(.title.bold())
                }
                    .padding(.bottom, 20)
                
                VStack {
                    Text("and you need to")
                    Text(winRequired ? "win!" : "fail!")
                        .font(.largeTitle.bold())
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    ForEach(GameSymbol.allCases, id: \.self) { symbol in
                        Button(
                            action: {
                                play(with: symbol)
                            },
                            label: {
                                Text(symbol == .rock ? "🪨" : symbol == .paper ? "🧻" : "✂️")
                                    .font(.system(size: 50))
                                    .frame(minWidth: 75, maxWidth: 75, minHeight: 75, maxHeight: 75)
                                    .background(Color.secondary)
                                    .foregroundStyle(.white)
                                    .clipShape(Capsule())
                            }
                        )
                        Spacer()
                    }
                }
                
                Spacer()
                Spacer()
                
                VStack {
                    HStack {
                        Text("Score: ")
                        Text("\(score)")
                            .foregroundStyle(score >= 0 ? .primary : Color.red)
                    }
                    .padding(.bottom, 10)
                    Text("Round \(round) of \(maxRounds)")
                }
                .font(.title.bold())
                .padding(.vertical, 20)
                .padding(.horizontal, 50)
                .background(.ultraThinMaterial)
                .clipShape(.capsule)
                
                Spacer()
            }
        }
        .alert("Game Over", isPresented: $gameOver) {
            Button("Play Again") {
                newGame()
            }
        } message: {
            Text("You got a total score of \(score).")
        }
        
    }
}

#Preview {
    ContentView()
}
