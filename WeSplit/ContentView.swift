//
//  ContentView.swift
//  WeSplit
//
//  Created by Andre Veltens on 18.11.24.
//

import SwiftUI

struct ContentView: View {
    @State private var totalPrice: Double = 0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 0
    @FocusState private var totalIsFocused: Bool
    
    let tipPercentages: [Int] = [5, 10, 15, 20, 0]
    
    var totalPerPerson: Double {
        let pplCount: Double = Double(numberOfPeople)
        return ceil((totalAfterTip / pplCount) * 100) / 100
    }
    
    var totalAfterTip: Double {
        let tipSelection: Double = Double(tipPercentage)
        let tipValue = totalPrice / 100 * tipSelection
        return totalPrice + tipValue
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("overview.splitInformation") {
                    HStack {
                        Text("overview.amountToSplit")
                        TextField("overview.amountInput", value: $totalPrice, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .focused($totalIsFocused)
                    }
                    HStack {
                        Picker("overview.splitBetween", selection: $numberOfPeople) {
                            ForEach(2...10, id: \.self) {
                                Text("^[\($0) Person](inflect: true)")
                            }
                        }
                    }
                }
                Section("overview.howMuchTip") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("overview.totalAfterTip") {
                    Text(totalAfterTip, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                    
                }
                Section("overview.totalPerPersonSection") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if totalIsFocused {
                    Button("Done") {
                        totalIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
