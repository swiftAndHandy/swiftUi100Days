//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Andre Veltens on 23.11.24.
//

import SwiftUI

struct FlagImage: View {
    var image: String
    
    var body: some View {
        Image(image)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var countries: [String] = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer: Int = Int.random(in: 0..<3)
    @State private var score: Int = 0
    
    @State private var roundCounter: Int = 0
    @State private var gameOver: Bool = false
    
    @State private var wrongAnswerGiven: Bool = false
    @State private var choosenFlag: String = ""
    
    var body: some View {
        ZStack {
//            RadialGradient(sto: [.blue, .red], center: .top, startRadius: 10, endRadius: 400)
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(image: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
                
            }
            .padding()
        }
        .alert("Wrong", isPresented: $wrongAnswerGiven) {
            Button("Continue", role: .none, action: newQuestion)
        } message: {
            Text("Your taped the flag of \(choosenFlag)")
        }
        .alert("Game is over", isPresented: $gameOver) {
            Button("Start new game", action: restartGame)
        } message: {
            if score == 8  {
                Text("You got \(score) of \(roundCounter) flags. Perfect!")
            } else if score >= 6 {
                Text("You got \(score) of \(roundCounter) flags. It's okay, but you can do better.")
            } else if score >= 4 {
                Text("You got \(score) of \(roundCounter) flags. There is space to improve.")
            } else if score >= 2 {
                Text("You got \(score) of \(roundCounter) flags. You bareley know you own country, hm?")
            } else {
                Text("You got \(score) of \(roundCounter) flags. Did you even try?")
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        choosenFlag = countries[number]
        roundCounter += 1
        if number == correctAnswer && roundCounter <= 8 {
            score += 1
            if roundCounter < 8 {
                newQuestion()
            }
        } else if roundCounter < 8 {
            wrongAnswerGiven = true
        }
        
        if roundCounter == 8 {
            gameOver = true
        }
    }
    
    func newQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restartGame() {
        score = 0
        roundCounter = 0
        wrongAnswerGiven = false
        newQuestion()
    }
    
}

#Preview {
    ContentView()
}
